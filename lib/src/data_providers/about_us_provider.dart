// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';

const urlAboutUsDataCU = 'https://cusobu.nat.cu/covid/api/v2/about_us.json';
const urlAboutUsDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/about_us.json';

Future<void> getAboutUsData() async {
  //print('getting about us data');
  Map<String, dynamic> data;
  var mode = PrefService.getInt(Constants.prefConnectionMode) ??
      Constants.ConnectionModeMerge;
  try {
    switch (mode) {
      case Constants.ConnectionModeIntranet:
        data = await getAboutUsDataFrom(urlAboutUsDataCU);
        break;
      case Constants.ConnectionModeInternet:
        data = await getAboutUsDataFrom(urlAboutUsDataIO);
        break;
      case Constants.ConnectionModeMerge:
      default:
        data = await getAboutUsDataFrom(urlAboutUsDataCU);
        if (data == null) {
          data = await getAboutUsDataFrom(urlAboutUsDataIO);
        }
    }
  } catch (e) {
    log(e.toString());
    //print(e.toString());
  }
  if (data == null) {
    data = await getAboutUsDataFromCache();
    log('Data obtained from cache.');
    //print('Data obtained from cache.');
    if (data == null) {
      return;
    }
  }
  //print(data);
  Constants.collaborators = (data['collaborators'] as List<dynamic>)
      .map((i) =>
          (i as Map<String, dynamic>).map((j, k) => MapEntry(j, k as String)))
      .toList();
  Constants.replicas = (data['replicas'] as List<dynamic>)
      .map((i) =>
          (i as Map<String, dynamic>).map((j, k) => MapEntry(j, k as String)))
      .toList();
  Constants.promotors = (data['promotors'] as List<dynamic>)
      .map((i) =>
          (i as Map<String, dynamic>).map((j, k) => MapEntry(j, k as String)))
      .toList();
  Constants.collabProjects = (data['collabProjects'] as List<dynamic>)
      .map((i) =>
          (i as Map<String, dynamic>).map((j, k) => MapEntry(j, k as String)))
      .toList();
  Constants.thanks = data['thanks'] as String;
}

Future<Map<String, dynamic>> getAboutUsDataFrom(String url) async {
  var resp = await http.get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    log('Source is invalid');
    //print('Source is invalid');
    return null;
    //throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    log('Bad request');
    //print('Bad request');
    return null;
    //throw BadRequestException('Bad request');
  }
  try {
    var json = jsonDecode(utf8.decode(resp.bodyBytes)) as Map<String, dynamic>;
    //print('get data from network');
    await setAboutUsDataToCache(json);
    return json;
  } catch (e) {
    log(e.toString());
    //print(e.toString());
    return null;
    //throw ParseException('Parse error');
  }
}

Future<Map<String, dynamic>> getAboutUsDataFromCache() async {
  try {
    var packageInfo = await PackageInfo.fromPlatform();
    var versionCodeNow = int.parse(packageInfo.buildNumber);
    var versionCodeOld = PrefService.getInt(Constants.prefVersionCode) ?? 0;
    if (versionCodeNow != versionCodeOld) {
      return null;
    }
    var data = PrefService.getString(Constants.prefDataAboutUs);
    if (data == null) {
      return null;
    }
    return jsonDecode(data) as Map<String, dynamic>;
  } catch (e) {
    log(e.toString());
    //print(e.toString());
  }
  return null;
}

Future<void> setAboutUsDataToCache(Map<String, dynamic> data) async {
  try {
    String result = jsonEncode(data);
    PrefService.setString(Constants.prefDataAboutUs, result);
  } catch (e) {
    log(e.toString());
    //print(e.toString());
  }
}
