import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:package_info/package_info.dart';
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
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    result = DataModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  try {
    int time = (DateTime.now().millisecondsSinceEpoch / 1000).round() - 1;
    PrefService.setInt(Constants.prefLastDataUpdate, time);
    var packageInfo = await PackageInfo.fromPlatform();
    var versionCode = int.parse(packageInfo.buildNumber);
    PrefService.setInt(Constants.prefVersionCode, versionCode);
  } catch (e) {
    log(e.toString());
  }
  return result;
}

Future<DataModel> getCubaDataFromCache() async {
  try {
    var packageInfo = await PackageInfo.fromPlatform();
    var versionCodeNow = int.parse(packageInfo.buildNumber);
    var versionCodeOld = PrefService.getInt(Constants.prefVersionCode);
    if (versionCodeNow != versionCodeOld) {
      return null;
    }
    var data = PrefService.getString(Constants.prefData);
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
    PrefService.setString(Constants.prefData, result);
  } catch (e) {
    log(e.toString());
  }
}
