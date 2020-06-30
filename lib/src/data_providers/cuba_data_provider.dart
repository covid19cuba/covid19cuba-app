// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/models/charts/state_model.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:crypto/crypto.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';

const urlCubaDataCU =
    'https://cusobu.nat.cu/covid/api/v2/full.json';
const urlCubaDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/full.json';

Future<Data> getCubaData() async {
  var stateList = await StateModel.check();
  var cache = true;
  if (stateList != null) {
    cache = stateList[1];
  }
  if (!cache) {
    var data = await getCubaDataFromCache();
    if (data != null) {
      log('Data obtained from cache.');
      return data;
    }
  }
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

Future<Data> getCubaDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  Data result;
  try {
    var text = utf8.decode(resp.bodyBytes);
    var bytes = utf8.encode(text);
    var digest = sha1.convert(bytes);
    PrefService.setString(Constants.prefCacheHash, digest.toString());
    var json = jsonDecode(text);
    result = Data.fromJson(json);
    PrefService.setBool(Constants.prefFirstCacheNotification, true);
    PrefService.setBool(Constants.prefFirstModificationNotification, true);
    PrefService.setString(
      Constants.prefPesquisador,
      jsonEncode(result.all.pesquisador.toJson()),
    );
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

Future<Data> getCubaDataFromCache() async {
  try {
    var packageInfo = await PackageInfo.fromPlatform();
    var versionCodeNow = int.parse(packageInfo.buildNumber);
    var versionCodeOld = PrefService.getInt(Constants.prefVersionCode) ?? 0;
    if (versionCodeOld != 0 && versionCodeNow != versionCodeOld) {
      return null;
    }
    var data = PrefService.getString(Constants.prefData);
    if (data == null) {
      return null;
    }
    return Data.fromJson(jsonDecode(data));
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<void> setCubaDataToCache(Data data) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString(Constants.prefData, result);
  } catch (e) {
    log(e.toString());
  }
}
