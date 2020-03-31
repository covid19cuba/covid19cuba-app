import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:preferences/preferences.dart';

const urlCountriesCU =
    'https://www.cusobu.nat.cu/covid/data/paises-info-dias.json';
const urlCountriesIO =
    'https://covid19cubadata.github.io/data/paises-info-dias.json';

Future<WorldTotalsModel> getCountriesData() async {
  try {
    return await getCountriesDataFrom(urlCountriesCU);
  } catch (e) {
    log(e.toString());
    return await getCountriesDataFrom(urlCountriesIO);
  }
}

Future<WorldTotalsModel> getCountriesDataFrom(String url) async {
  var resp = await get(url);
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  WorldTotalsModel result;
  try {
    var json = jsonDecode(resp.body);
    result = WorldTotalsModel.fromJson(json);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return result;
}

Future<WorldTotalsModel> getCountriesDataFromCache() async {
  try {
    var data = PrefService.getString('countries_data');
    if (data == null) {
      return null;
    }
    return WorldTotalsModel.fromJson(jsonDecode(data));
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<void> setCountriesDataToCache(WorldTotalsModel data) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString('countries_data', result);
  } catch (e) {
    log(e.toString());
  }
}
