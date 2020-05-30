// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import '../utils/http_proxy.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const urlJTNewsDataCU = 'https://cusobu.nat.cu/covid/api/v1/jt_news.json';
const urlJTNewsDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v1/jt_news.json';

Future<JTNewsModel> getJTNewsData() async {
  var stateList = await JTNewsStateModel.check();
  var cache = true;
  if (stateList != null) {
    cache = stateList[0];
  }
  if (!cache) {
    var data = await getJTNewsDataFromCache();
    if (data != null) {
      log('Data obtained from cache.');
      return data;
    }
  }
  PrefService.setBool(Constants.prefBadgeNews, true);
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

Future<JTNewsModel> getJTNewsDataFromCache() async {
  try {
    var packageInfo = await PackageInfo.fromPlatform();
    var versionCodeNow = int.parse(packageInfo.buildNumber);
    var versionCodeOld = PrefService.getInt(Constants.prefVersionCode) ?? 0;
    if (versionCodeNow != versionCodeOld) {
      return null;
    }
    var data = PrefService.getString(Constants.prefDataJTNews);
    if (data == null) {
      return null;
    }
    return JTNewsModel.fromJson(jsonDecode(data));
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<void> setJTNewsDataToCache(JTNewsModel data) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString(Constants.prefDataJTNews, result);
  } catch (e) {
    log(e.toString());
  }
}
