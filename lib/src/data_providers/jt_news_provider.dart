import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const urlJTNewsDataCU = 'https://cusobu.nat.cu/covid/api/v1/JTNews.json';
const urlJTNewsDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v1/JTNews.json';

Future<JTNewsModel> getJTNewsData() async {
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  switch (mode) {
    case Constants.ConnectionModeIntranet:
      return await getJTNewsDataFrom(urlJTNewsDataCU);
    case Constants.ConnectionModeInternet:
      return await getJTNewsDataFrom(urlJTNewsDataIO);
    case Constants.ConnectionModeMerge:
    default:
      try {
        return await getJTNewsDataFrom(urlJTNewsDataCU);
      } catch (e) {
        log(e.toString());
        return await getJTNewsDataFrom(urlJTNewsDataIO);
      }
  }
}

Future<JTNewsModel> getJTNewsDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  JTNewsModel result;
  try {
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    result = JTNewsModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return result;
}
