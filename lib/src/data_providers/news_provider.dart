// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';

import '../utils/http_proxy.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const urlNewsDataCU =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/news.json';
const urlNewsDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/news.json';

Future<NewsModel> getNewsData() async {
  var stateList = await NewsStateModel.check();
  var cache = true;
  if (stateList != null) {
    cache = stateList[0];
  }
  if (!cache) {
    var data = await getNewsDataFromCache();
    if (data != null) {
      log('Data obtained from cache.');
      return data;
    }
  }
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  switch (mode) {
    case Constants.ConnectionModeIntranet:
      return await getNewsDataFrom(urlNewsDataCU);
    case Constants.ConnectionModeInternet:
      return await getNewsDataFrom(urlNewsDataIO);
    case Constants.ConnectionModeMerge:
    default:
      try {
        return await getNewsDataFrom(urlNewsDataCU);
      } catch (e) {
        log(e.toString());
        return await getNewsDataFrom(urlNewsDataIO);
      }
  }
}

Future<NewsModel> getNewsDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  NewsModel result;
  try {
    var text = utf8.decode(resp.bodyBytes);
    var bytes = utf8.encode(text);
    var digest = sha1.convert(bytes);
    PrefService.setString(Constants.prefCacheNewsHash, digest.toString());
    PrefService.setBool(Constants.prefBadgeNews, true);
    var json = jsonDecode(text);
    result = NewsModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return result;
}

Future<NewsModel> getNewsDataFromCache() async {
  try {
    var packageInfo = await PackageInfo.fromPlatform();
    var versionCodeNow = int.parse(packageInfo.buildNumber);
    var versionCodeOld = PrefService.getInt(Constants.prefVersionCode) ?? 0;
    if (versionCodeNow != versionCodeOld) {
      return null;
    }
    var data = PrefService.getString(Constants.prefDataNews);
    if (data == null) {
      return null;
    }
    return NewsModel.fromJson(jsonDecode(data));
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<void> setNewsDataToCache(NewsModel data) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString(Constants.prefDataNews, result);
  } catch (e) {
    log(e.toString());
  }
}
