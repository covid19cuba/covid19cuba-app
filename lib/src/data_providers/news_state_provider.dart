// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import '../utils/http_proxy.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const urlNewsStateDataCU =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/news_state.json';
const urlNewsStateDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/news_state.json';

Future<NewsStateModel> getNewsStateData() async {
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  switch (mode) {
    case Constants.ConnectionModeIntranet:
      return await getNewsStateDataFrom(urlNewsStateDataCU);
    case Constants.ConnectionModeInternet:
      return await getNewsStateDataFrom(urlNewsStateDataIO);
    case Constants.ConnectionModeMerge:
    default:
      try {
        return await getNewsStateDataFrom(urlNewsStateDataCU);
      } catch (e) {
        log(e.toString());
        return await getNewsStateDataFrom(urlNewsStateDataIO);
      }
  }
}

Future<NewsStateModel> getNewsStateDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  NewsStateModel result;
  try {
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    result = NewsStateModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return result;
}
