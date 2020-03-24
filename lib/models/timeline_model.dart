import 'package:flutter/cupertino.dart';
import 'region_model.dart';

class TimelineModel {
  final String updated;
  final List<RegionModel> regions;

  const TimelineModel({@required this.regions, @required this.updated})
      : assert(regions != null),
        assert(updated != null);

  static TimelineModel parse(dynamic json) {
    final data = json as Map;
    String mark = '';
    var regions = List<RegionModel>();
    for (final region in data.keys) {
      if (region == 'updated') {
        mark = data[region];
      }
      else if (region == 'success'){
        continue; // this value is not needed
      }
      else {
        regions.add(RegionModel.parse(region, data[region]));
      }
    }
    return TimelineModel(updated: mark,regions: regions);
  }
}
