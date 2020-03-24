import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'region_model.dart';

class TimelineModel {
  final DateTime updated;
  final List<RegionModel> regions;

  const TimelineModel({@required this.regions, @required this.updated})
      : assert(regions != null),
        assert(updated != null);

  static TimelineModel parse(dynamic json) {
    final data = json as Map;
    DateTime date;
    var regions = List<RegionModel>();
    for (final region in data.keys) {
      if (region == 'updated') {
        int timestamp = int.parse(data[region]) * 1000;
        date = DateTime.fromMillisecondsSinceEpoch(timestamp);
      } else if (region == 'success') {
        continue; // this value is not needed
      } else {
        regions.add(RegionModel.parse(region, data[region]));
      }
    }
    return TimelineModel(updated: date, regions: regions);
  }
}
