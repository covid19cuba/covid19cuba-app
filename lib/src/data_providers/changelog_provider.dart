import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const urlChangelogDataCU = 'https://cusobu.nat.cu/covid/api/v1/changelog.json';
const urlChangelogDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v1/changelog.json';

Future<ChangelogModel> getChangelogData() async {
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  switch (mode) {
    case Constants.ConnectionModeIntranet:
      return await getChangelogDataFrom(urlChangelogDataCU);
    case Constants.ConnectionModeInternet:
      return await getChangelogDataFrom(urlChangelogDataIO);
    case Constants.ConnectionModeMerge:
    default:
      try {
        return await getChangelogDataFrom(urlChangelogDataCU);
      } catch (e) {
        log(e.toString());
        return await getChangelogDataFrom(urlChangelogDataIO);
      }
  }
}

Future<ChangelogModel> getChangelogDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  ChangelogModel result;
  try {
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    result = ChangelogModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return result;
}
