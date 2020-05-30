// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/utils/utils.dart';

const urlAboutUsDataCU = 'https://cusobu.nat.cu/covid/api/v1/about_us.json';
const urlAboutUsDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v1/about_us.json';

Future<void> getAboutUsData() async {
  print('getting about us data');
  var data = await getAboutUsDataFromCache();
  if (data != null) {
    log('Data obtained from cache.');
    print('Data obtained from cache.');
  }
  else{
    var mode = PrefService.getInt(Constants.prefConnectionMode) ?? Constants.ConnectionModeMerge;
    switch (mode) {
      case Constants.ConnectionModeIntranet:
        data = await getAboutUsDataFrom(urlAboutUsDataCU);
        break;
      case Constants.ConnectionModeInternet:
        data = await getAboutUsDataFrom(urlAboutUsDataIO);
        break;
      case Constants.ConnectionModeMerge:
      default:
        try {
          data = await getAboutUsDataFrom(urlAboutUsDataCU);
        } catch (e) {
          log(e.toString());
          print(e.toString());
          data = await getAboutUsDataFrom(urlAboutUsDataIO);
        }
    }
  }
  Constants.collaborators=data;
}

Future<List<Map<String,String>>> getAboutUsDataFrom(String url) async {
  var resp = await get(url, headers: {
    'Accept-Encoding': 'gzip, deflate, br',
  });
  if (resp.statusCode == 404) {
    log('Source is invalid');
    print('Source is invalid');
    return Constants.collaborators;
    //throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    log('Bad request');
    print('Bad request');
    return Constants.collaborators;
    //throw BadRequestException('Bad request');
  }
  List<Map<String,String>> result;
  try {
    var json = jsonDecode(utf8.decode(resp.bodyBytes));
    result = (jsonDecode(json) as List<dynamic>).map((i)=>(i as Map<String,dynamic>).map((j,k)=>MapEntry(j, k as String))).toList();
    await setAboutUsDataToCache(result);
  } catch (e) {
    log(e.toString());
    print(e.toString());
    return Constants.collaborators;
    //throw ParseException('Parse error');
  }
  return result;
}

Future<List<Map<String,String>>> getAboutUsDataFromCache() async {
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
    return (jsonDecode(data) as List<dynamic>).map((i)=>(i as Map<String,dynamic>).map((j,k)=>MapEntry(j, k as String))).toList();
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<void> setAboutUsDataToCache(List<Map<String,String>> data) async {
  try {
    String result = jsonEncode(data);
    PrefService.setString(Constants.prefDataJTNews, result);
  } catch (e) {
    log(e.toString());
  }
}
