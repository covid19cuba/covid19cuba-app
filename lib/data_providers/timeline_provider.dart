import 'dart:convert';

import 'package:http/http.dart';

import 'package:covid19cuba/models/models.dart';

Future<TimelineModel> fecthTimeLine() async {
  var response = await get('http://www.cusobu.nat.cu/covid/timeseries/get');
  if (response.statusCode == 404) {
    return null; // this should throw an exception
  } else if (response.statusCode != 200) {
    return null; // this should throw an exception
  }
  var json = jsonDecode(response.body);
  return TimelineModel.parse(json);
}
