import 'dart:convert';
import 'dart:developer';

import 'package:covid19cuba/src/models/models.dart';
import 'package:preferences/preferences.dart';
import 'package:covid19cuba/src/utils/utils.dart';

import '../utils/utils.dart';

Future<ConfigurationModel> getConfigurationFromCache() async {
  try {
    var data = PrefService.getString('configuration');
    if (data == null) {
      ConfigurationModel data = ConfigurationModel.fromJson({
        Constants.prefCompareCountry: Constants.defaultCompareCountry,
      });
      setConfigurationToCache(data);
      return data;
    }
    return ConfigurationModel.fromJson(jsonDecode(data));
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<void> setConfigurationToCache(ConfigurationModel data) async {
  try {
    String result = jsonEncode(data.toJson());
    PrefService.setString('configuration', result);
  } catch (e) {
    log(e.toString());
  }
}
