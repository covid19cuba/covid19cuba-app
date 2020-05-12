// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const urlJTNewsStateDataCU =
    'https://cusobu.nat.cu/covid/api/v1/jt_news_state.json';
const urlJTNewsStateDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v1/jt_news_state.json';

Future<JTNewsStateModel> getJTNewsStateData() async {
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  switch (mode) {
    case Constants.ConnectionModeIntranet:
      return await getJTNewsStateDataFrom(urlJTNewsStateDataCU);
    case Constants.ConnectionModeInternet:
      return await getJTNewsStateDataFrom(urlJTNewsStateDataIO);
    case Constants.ConnectionModeMerge:
    default:
      try {
        return await getJTNewsStateDataFrom(urlJTNewsStateDataCU);
      } catch (e) {
        log(e.toString());
        return await getJTNewsStateDataFrom(urlJTNewsStateDataIO);
      }
  }
}

Future<JTNewsStateModel> getJTNewsStateDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  JTNewsStateModel result;
  try {
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    result = JTNewsStateModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return result;
}
