import 'package:flutter/material.dart';

import 'daily_status_model.dart';

class RegionModel {
  final String name;
  final List<DailyReportModel> reports;

  const RegionModel({@required this.name, @required this.reports})
      : assert(name != null),
        assert(reports != null);

  static RegionModel parse(String name, List<dynamic> json) {
    var reports = List<DailyReportModel>();
    json.forEach((report) {
      reports.add(DailyReportModel.parse(report));
    });
    return RegionModel(
      name: name,
      reports: reports,
    );
  }
}
