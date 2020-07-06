// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:covid19cuba/src/models/charts/state_model.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:preferences/preferences.dart';

const urlStateDataCU = 'https://cusobu.nat.cu/covid/api/v2/state.json';
const urlStateDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/state.json';

Future<StateModel> getStateData() async {
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  switch (mode) {
    case Constants.ConnectionModeIntranet:
      return await getStateDataFrom(urlStateDataCU);
    case Constants.ConnectionModeInternet:
      return await getStateDataFrom(urlStateDataIO);
    case Constants.ConnectionModeMerge:
    default:
      try {
        return await getStateDataFrom(urlStateDataCU);
      } catch (e) {
        log(e.toString());
        return await getStateDataFrom(urlStateDataIO);
      }
  }
}

Future<StateModel> getStateDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  StateModel result;
  try {
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    result = StateModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return result;
}
