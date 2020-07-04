// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:covid19cuba/src/models/model.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:crypto/crypto.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';

abstract class DataProvider<T extends Model, E extends CacheModel> {
  String get urlDataCU;

  String get urlDataIO;

  String get urlDataStateCU;

  String get urlDataStateIO;

  String get prefHash;

  String get prefData;

  Future<T> getData() async {
    var cache = await useCache();
    if (cache) {
      var data = await getDataFromCache();
      if (data != null) {
        log('Data obtained from cache.');
        return data;
      }
    }
    var mode = PrefService.getInt(Constants.prefConnectionMode) ??
        Constants.ConnectionModeMerge;
    switch (mode) {
      case Constants.ConnectionModeIntranet:
        return await getDataFrom(urlDataCU);
      case Constants.ConnectionModeInternet:
        return await getDataFrom(urlDataIO);
      case Constants.ConnectionModeMerge:
      default:
        try {
          return await getDataFrom(urlDataCU);
        } catch (e) {
          log(e.toString());
          return await getDataFrom(urlDataIO);
        }
    }
  }

  T dataFromJson(Map<String, dynamic> data);

  E dataStateFromJson(Map<String, dynamic> data);

  Future<T> getDataFrom(String url) async {
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
      var text = utf8.decode(resp.bodyBytes);
      var bytes = utf8.encode(text);
      var digest = sha1.convert(bytes);
      PrefService.setString(prefHash, digest.toString());
      executeOk();
      var json = jsonDecode(text);
      result = dataFromJson(json);
    } catch (e) {
      log(e.toString());
      throw ParseException('Parse error');
    }
    return result;
  }

  Future<T> getDataFromCache() async {
    try {
      var packageInfo = await PackageInfo.fromPlatform();
      var versionCodeNow = int.parse(packageInfo.buildNumber);
      var versionCodeOld = PrefService.getInt(Constants.prefVersionCode) ?? 0;
      if (versionCodeOld != 0 && versionCodeNow != versionCodeOld) {
        return null;
      }
      var data = PrefService.getString(prefData);
      if (data == null) {
        return null;
      }
      return dataFromJson(jsonDecode(data));
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> setDataToCache(T data) async {
    try {
      String result = jsonEncode(data.toJson());
      PrefService.setString(prefData, result);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<E> getStateData() async {
    var mode = PrefService.getInt(Constants.prefConnectionMode) ??
        Constants.ConnectionModeMerge;
    switch (mode) {
      case Constants.ConnectionModeIntranet:
        return await getStateDataFrom(urlDataStateCU);
      case Constants.ConnectionModeInternet:
        return await getStateDataFrom(urlDataStateIO);
      case Constants.ConnectionModeMerge:
      default:
        try {
          return await getStateDataFrom(urlDataStateCU);
        } catch (e) {
          log(e.toString());
          return await getStateDataFrom(urlDataStateIO);
        }
    }
  }

  Future<E> getStateDataFrom(String url) async {
    var resp = await get(url, headers: {
      'Accept-Encoding': 'gzip, deflate, br',
    });
    if (resp.statusCode == 404) {
      throw InvalidSourceException('Source is invalid');
    } else if (resp.statusCode != 200) {
      throw BadRequestException('Bad request');
    }
    E result;
    try {
      var json = jsonDecode(utf8.decode(resp.bodyBytes));
      result = dataStateFromJson(json);
    } catch (e) {
      log(e.toString());
      throw ParseException('Parse error');
    }
    return result;
  }

  Future<bool> useCache() async {
    try {
      var state = await getStateData();
      var cacheNew = state.cache;
      var cacheOld = PrefService.getString(prefHash) ?? "";
      var cache = cacheNew == cacheOld;
      return cache;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  void executeOk() {}
}
