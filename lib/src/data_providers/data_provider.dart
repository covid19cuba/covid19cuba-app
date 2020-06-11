import 'package:preferences/preferences.dart';
import 'dart:developer';
import '../utils/http_proxy.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'dart:convert';

typedef ParserMethod<T> = T Function(Map<String, dynamic> data);

class DataProvider<T>{
  static final String sourceCu = "https://cusobu.nat.cu/covid";
  static final String sourceIo = "https://covid19cuba.github.io/covid19cubadata.github.io";

  final String cuPath;
  final String ioPath;

  final ParserMethod<T> parser;

  const DataProvider({this.ioPath, this.cuPath, this.parser});

  Future<T> getDataFrom(String url) async{
    var resp = await get(url, headers: {
      'Accept-Encoding': 'gzip, deflate, br',
    });
    if (resp.statusCode == 404) {
      throw InvalidSourceException('Source is invalid');
    } else if (resp.statusCode != 200) {
      throw BadRequestException('Bad request');
    }
    T result;
    try {
      var json = jsonDecode(utf8.decode(resp.bodyBytes));
      result = parser(json);
    } catch (e) {
      log(e.toString());
      throw ParseException('Parse error');
    }
    return result;
  }

  Future<T> getData() async {
    var mode = PrefService.getInt(Constants.prefConnectionMode) ??
        Constants.ConnectionModeMerge;
    switch (mode) {
      case Constants.ConnectionModeIntranet:
        return await getDataFrom(sourceCu + cuPath);
      case Constants.ConnectionModeInternet:
        return await getDataFrom(sourceIo + ioPath);
      case Constants.ConnectionModeMerge:
      default:
        try {
          return await getDataFrom(sourceCu + cuPath);
        } catch (e) {
          log(e.toString());
          return await getDataFrom(sourceIo + ioPath);
        }
    }
  }
}