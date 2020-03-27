import 'package:flutter/material.dart';

class DailyReportModel {
  final int recovered;
  final int deaths;
  final int confirmed;
  final DateTime date;

  const DailyReportModel(
      {@required this.recovered,
      @required this.confirmed,
      @required this.deaths,
      @required this.date})
      : assert(date != null),
        assert(recovered != null),
        assert(confirmed != null),
        assert(deaths != null);

  static DailyReportModel parse(dynamic json) {
    String date = json['date'];
    return DailyReportModel(
      recovered: json['recovered'],
      confirmed: json['confirmed'],
      deaths: json['deaths'],
      date: _getDate(date),
    );
  }

  static DateTime _getDate(String date) {
    var data = date.split('-');
    var year = int.parse(data[0]);
    var month = int.parse(data[1]);
    var day = int.parse(data[2]);
    return DateTime(year, month, day);
  }
}
