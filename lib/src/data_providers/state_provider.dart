import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const urlStateDataCU = 'https://cusobu.nat.cu/covid/api/v1/state.json';
const urlStateDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v1/state.json';

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
