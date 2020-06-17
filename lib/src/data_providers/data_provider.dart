// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.s

import 'package:flutter/cupertino.dart';
import 'package:preferences/preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import '../utils/http_proxy.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'dart:convert';
import '../models/state.dart';
import '../models/model.dart';

typedef ParserMethod<T> = T Function(Map<String, dynamic> data);
typedef CacheCheckMethod<T extends CacheState> = Future<bool> Function( DataProvider<T>
    provider, String prefCache);

Future<bool> basicCacheCheck<T extends CacheState>(DataProvider<T> state, String prefCache) async {
  String cache = PrefService.getString(prefCache);
  T serverCache = await state.getData();
  if (cache == serverCache.cache){
    return true;
  }
  return false;
}

class DataProvider<T> {
  static final String sourceCu = "https://cusobu.nat.cu/covid";
  static final String sourceIo =
      "https://covid19cuba.github.io/covid19cubadata.github.io";

  final String cuPath;
  final String ioPath;
  final http.BaseClient client;

  final ParserMethod<T> parser;

  const DataProvider(
      {@required this.ioPath, @required this.cuPath, @required this.parser, this.client});

  Future<T> getDataFrom(String url) async {
    var headers = {
      'Accept-Encoding': 'gzip, deflate, br',
    };
    var method = client?.get ?? get;
    var resp = await method(url, headers: headers);

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

Future<T> getDataAndCacheCheck<T, F extends CacheState>(
   { CacheCheckMethod cacheCheck = basicCacheCheck,
  @required DataProvider<T> dataProvider,
  @required DataProvider<F> cacheProvider,
  @required String dataStateKey,
  @required String dataCacheKey,
}) async {
  bool cacheHit = await cacheCheck(cacheProvider, dataStateKey);

  return cacheHit
      ? getDataFromCache(dataProvider, dataCacheKey)
      : dataProvider.getData();
}

Future<T> getDataFromCache<T>(DataProvider<T> dataProvider, String dataCacheKey) async{
  String cache = PrefService.getString(dataCacheKey);
  if (cache == null) {
    return null;
  }
  return dataProvider.parser(jsonDecode(cache));
}

Future<void> setDataToCache<T extends Model>(T data, String prefKey) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString(prefKey, result);
  } catch (e) {
    log(e.toString());
  }
}