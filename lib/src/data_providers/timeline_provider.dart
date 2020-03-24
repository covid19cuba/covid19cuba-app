import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

Future<TimelineModel> fecthTimeLine() async {
  var resp = await get('http://www.cusobu.nat.cu/covid/timeseries/get');
  if (resp.statusCode == 404) {
    throw InvalidSourceException('Source is invalid');
  } else if (resp.statusCode != 200) {
    throw BadRequestException('Bad request');
  }
  TimelineModel result;
  try {
    result = TimelineModel.parse(jsonDecode(resp.body));
  } catch (e) {
    log(e);
    throw ParseException('Parse error');
  }
  return result;
}
