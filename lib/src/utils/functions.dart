import 'dart:convert';
import 'dart:developer';

import 'package:package_info/package_info.dart';
import 'package:preferences/preference_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

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
    log("Url $url resolve failed");
    //throw InvalidSourceException("No se ha podido obtener la url");
  }
}

int getDayFromCache() {
  var data = PrefService.getString(Constants.prefData);
  if (data != null) {
    DataModel dta = DataModel.fromJson(jsonDecode(data));
    return dta.all.evolutionOfCasesByDays.accumulated.values.length;
  }
  return -1;
}

Future<String> getSharedContent() async {
  var packageInfo = await PackageInfo.fromPlatform();
  var apklisUrl =
      'https://archive.apklis.cu/application/apk/club.postdata.covid19cuba-v${packageInfo.buildNumber}.apk';
  var gitHubUrl =
      'https://github.com/covid19cuba/covid19cuba-app/releases/download/v${packageInfo.version}/app.apk';
  var sharedContent = """Covid19 Cuba Data

Proyecto para conocer los reportes diarios, estadísticas, etc. respecto a la Covid-19 en Cuba.

Aplicación:
- Apklis: $apklisUrl
- GitHub: $gitHubUrl

Sitio Web: https://covid19cubadata.github.io

Replicas del Sitio Web:
- http://www.cusobu.nat.cu/covid cortesía de CUSOBU
- http://covid19.frcuba.cu cortesía de la Federación de Radioaficionados de Cuba
- http://covidcuba.swlx.info cortesía del Proyecto SWL-X
- http://covid19.jovenclub.cu cortesía de Joven Club

Bot de Telegram: https://t.me/covid19cubadata_bot

Colaboradores:
- CUSOBU: https://www.cusobu.nat.cu
- Proyecto SWL-X: https://www.swlx.info
- Daxslab: https://www.daxslab.com
- Unión de Informáticos de Cuba: https://www.uic.cu
- Universidad de Oriente: https://www.uo.edu.cu
- Universidad de La Habana: http://www.uh.cu

Agradecimientos: El equipo de desarrollo de Covid19 Cuba Data agradece a todos los que de una forma u otra ayudan a combatir la pandemia de la Covid-19, en especial a los que arriesgan su vida luchando en primera línea.

Autores:
- MatCom: http://www.matcom.uh.cu
- Postdata.club: https://www.postdata.club
- Juventud Técnica: https://medium.com/juventud-técnica

Copyright 2020 ©️""";
  return sharedContent;
}
