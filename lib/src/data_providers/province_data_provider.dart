import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

Future<ProvinceModel> getProvinceData(String province) async {
  var urlCubaDataCU =
      'https://cusobu.nat.cu/covid/api/v1/provinces/$province/all.json';
  var urlCubaDataIO =
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v1/provinces/$province/all.json';
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  /*switch (mode) {
    case Constants.ConnectionModeIntranet:
      return await getProvinceDataFrom(urlCubaDataCU);
    case Constants.ConnectionModeInternet:
      return await getProvinceDataFrom(urlCubaDataIO);
    case Constants.ConnectionModeMerge:
    default:
      try {
        return await getProvinceDataFrom(urlCubaDataCU);
      } catch (e) {
        log(e.toString());*/
        return await getProvinceDataFrom(urlCubaDataIO);
      //}
  //}
}

Future<ProvinceModel> getProvinceDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  ProvinceModel result;
  try {
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    result = ProvinceModel.fromJson(json);
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
