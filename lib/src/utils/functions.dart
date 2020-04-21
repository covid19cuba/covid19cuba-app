import 'dart:convert';
import 'package:covid19cuba/src/models/models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:preferences/preference_service.dart';
import 'utils.dart';
import 'dart:developer';

int getInt(dynamic value) {
  return value is String ? int.parse(value) : value;
}

DateTime dateTimeFromJson(String dateTime) {
  if (dateTime == null) {
    return null;
  }
  var split = dateTime.split('/');
  if (split.length <= 2) {
    var month = int.parse(split[0]);
    var day = int.parse(split[1]);
    return DateTime(0, month, day);
  }
  var year = int.parse(split[0]);
  var month = int.parse(split[1]);
  var day = int.parse(split[2]);
  return DateTime(year, month, day);
}

String dateTimeToJson(DateTime dateTime) {
  if (dateTime == null) {
    return null;
  }
  if (dateTime.year == 0) {
    return '${dateTime.month}/${dateTime.day}';
  }
  return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
}

List<DateTime> dateTimeListFromJson(List<dynamic> x) {
  var result = List<DateTime>();
  for (var i in x) {
    result.add(dateTimeFromJson(i as String));
  }
  return result;
}

List<dynamic> dateTimeListToJson(List<DateTime> x) {
  var result = List<String>();
  for (var i in x) {
    result.add(dateTimeToJson(i));
  }
  return result;
}

extension DateTimeToString on DateTime {
  String toStr() {
    return dateTimeToJson(this);
  }

  String toStrShort() {
    return '${this.day}/${this.month}';
  }

  String toStrPlus() {
    var months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    return '${this.day} de ${months[this.month - 1]} del ${this.year}';
  }
}

void getUrl(url) async {
  if (await canLaunch(url)) {
    launch(url);
  } else {
    log("Download url failed");
    throw InvalidSourceException("No se ha podido obtener la url");
  }
}

int getDayFromCache() {
  var data = PrefService.getString(Constants.prefData);
  if (data != null){
    DataModel dta = DataModel.fromJson(jsonDecode(data));
    return dta.all.evolutionOfCasesByDays.accumulated.values.length;
  }
  return -1;
}