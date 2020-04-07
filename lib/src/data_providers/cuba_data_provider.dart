import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const urlCubaDataCU = 'https://cusobu.nat.cu/covid/api/v1/all.json';
const urlCubaDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v1/all.json';

Future<DataModel> getCubaData() async {
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  switch (mode) {
    case Constants.ConnectionModeIntranet:
      return await getCubaDataFrom(urlCubaDataCU);
    case Constants.ConnectionModeInternet:
      return await getCubaDataFrom(urlCubaDataIO);
    case Constants.ConnectionModeMerge:
    default:
      try {
        return await getCubaDataFrom(urlCubaDataCU);
      } catch (e) {
        log(e.toString());
        return await getCubaDataFrom(urlCubaDataIO);
      }
  }
}

Future<DataModel> getCubaDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  DataModel result;
  try {
    var json = jsonDecode(resp.body);
    result = DataModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  try {
    int time = (DateTime.now().millisecondsSinceEpoch / 1000).round() - 1;
    PrefService.setInt('last_data_update', time);
  } catch (e) {
    log(e.toString());
  }
  return result;
}

Future<DataModel> getCubaDataFromCache() async {
  try {
    var data = PrefService.getString('data');
    if (data == null) {
      return null;
    }
    return DataModel.fromJson(jsonDecode(data));
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<void> setCubaDataToCache(DataModel data) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString('data', result);
  } catch (e) {
    log(e.toString());
  }
}
