import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:covid19cuba/src/utils/utils.dart';

const is_info_updated_url = 'http://www.cusobu.nat.cu/covid/cubadata/status/';

Future<Map<String,dynamic>> isInfoUpdated() async{
  int time = (DateTime.now().millisecondsSinceEpoch / 1000).round() - 1;
  var response = await get(
      is_info_updated_url + time.toString());
  if (response.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (response.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  Map<String,dynamic> json;
  try {
    json = jsonDecode(response.body);
  } catch (e) {
    log(e.toString());
    throw ParseException('Parse error');
  }
  return json;
}