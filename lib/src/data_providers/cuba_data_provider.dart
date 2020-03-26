import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:preferences/preferences.dart';

const urlCU = 'http://www.cusobu.nat.cu/covid/cubadata/get';
const urlIO = 'https://covid19cubadata.github.io/data/covid19-cuba.json';

Future<DataModel> getData() async {
  try {
    return await getDataFromCU();
  } catch (e) {
    log(e.toString());
    return await getDataFromIO();
  }
}

Future<DataModel> getDataFromCU() async {
  var resp = await get(urlCU);
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
  return result;
}

Future<DataModel> getDataFromIO() async {
  var resp = await get(urlIO);
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
  return result;
}

Future<DataModel> getDataFromCache() async {
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

Future<void> setDataToCache(DataModel data) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString('data', result);
  } catch (e) {
    log(e.toString());
  }
}
