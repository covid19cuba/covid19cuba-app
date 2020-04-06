import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const is_info_updated_url = 'https://www.cusobu.nat.cu/covid/cubadata/status/';

Future<InfoUpdate> isInfoUpdated() async {
  int time;
  try {
    time = PrefService.getInt(Constants.prefLastDataUpdate);
  } catch (e) {
    log(e.toString());
    time = (DateTime.now().millisecondsSinceEpoch / 1000).round() - 1;
  }
  var response = await get('$is_info_updated_url$time');
  if (response.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (response.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  InfoUpdate update;
  try {
    update = InfoUpdate.fromJson(jsonDecode(response.body));
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return update;
}
