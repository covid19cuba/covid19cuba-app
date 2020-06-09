// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/utils/utils.dart';

const urlFaqsDataCU = 'https://cusobu.nat.cu/covid/api/v2/faqs.json';
const urlFaqsDataIO =
    'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/faqs.json';

Future<void> getFaqsData() async {
  //print('getting faqs data');
  var data = null;
  var mode = PrefService.getInt(Constants.prefConnectionMode) ?? Constants.ConnectionModeMerge;
  try {
    switch (mode) {
      case Constants.ConnectionModeIntranet:
        data = await getFaqsDataFrom(urlFaqsDataCU);
        break;
      case Constants.ConnectionModeInternet:
        data = await getFaqsDataFrom(urlFaqsDataIO);
        break;
      case Constants.ConnectionModeMerge:
      default:
          data = await getFaqsDataFrom(urlFaqsDataCU);
          if(data == null){
            data = await getFaqsDataFrom(urlFaqsDataIO);
          }
    }
  } catch (e) {
    log(e.toString());
    //print(e.toString());
  }
  if (data == null) {
    data = await getFaqsDataFromCache();
    if (data == null) {return ;}
    log('Data obtained from cache.');
    //print('Data obtained from cache.');
  }
  //print(data);
  Constants.faqs=(data as List<dynamic>).map((e) => (e as List<dynamic>).map((f) => (f as String)).toList()).toList();
}

Future<List<dynamic>> getFaqsDataFrom(String url) async {
  var resp = await get(url, headers: {
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
    var json = jsonDecode(utf8.decode(resp.bodyBytes)) as List<dynamic>;
    //print('get data from network');
    await setFaqsDataToCache(json);
    return json;
  } catch (e) {
    log(e.toString());
    //print(e.toString());
    return null;
    //throw ParseException('Parse error');
  }
}

Future<List<dynamic>> getFaqsDataFromCache() async {
  try {
    var packageInfo = await PackageInfo.fromPlatform();
    var versionCodeNow = int.parse(packageInfo.buildNumber);
    var versionCodeOld = PrefService.getInt(Constants.prefVersionCode) ?? 0;
    if (versionCodeNow != versionCodeOld) {
      return null;
    }
    var data = PrefService.getString(Constants.prefDataFaqs);
    if (data == null) {
      return null;
    }
    return jsonDecode(data) as List<dynamic>;
  } catch (e) {
    log(e.toString());
    //print(e.toString());
  }
  return null;
}

Future<void> setFaqsDataToCache(List<dynamic> data) async {
  try {
    String result = jsonEncode(data);
    PrefService.setString(Constants.prefDataFaqs, result);
  } catch (e) {
    log(e.toString());
    //print(e.toString());
  }
}
