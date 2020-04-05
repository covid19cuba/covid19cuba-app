import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:preferences/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

const urlCubaDataCU = 'https://www.cusobu.nat.cu/covid/data/covid19-cuba.json';
const urlCubaDataIO =
    'https://covid19cubadata.github.io/data/covid19-cuba.json';

Future<DataModel> getCubaData() async {
  try {
    return await getCubaDataFrom(urlCubaDataCU);
  } catch (e) {
    log(e.toString());
    return await getCubaDataFrom(urlCubaDataIO);
  }
}

Future<DataModel> getCubaDataFrom(String url) async {
  var resp = await get(url, headers: {'Accept-Encoding':'gzip, deflate, br'});
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  DataModel result;
  try {
    result = DataModel.fromJson(jsonDecode(resp.body));
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int time = (DateTime.now().millisecondsSinceEpoch / 1000).round() - 1;
    prefs.setInt('last_data_update', time);
  }
  catch (e) {
    log(e.toString());
  }
  return result;
}

Future<DataModel> getCubaDataFromCache() async {
  try {
    var data = PrefService.getString('data');
    if (data == null) {
      return null;
    }
    return DataModel.fromJson(jsonDecode(data));
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<void> setCubaDataToCache(DataModel data) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString('data', result);
  } catch (e) {
    log(e.toString());
  }
}
