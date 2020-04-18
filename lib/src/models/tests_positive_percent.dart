import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'tests_positive_percent.g.dart';

@JsonSerializable()
class TestsPositivePercent {
  ItemDateList date;
  ItemDoubleList daily;
  ItemDoubleList accumulated;

  TestsPositivePercent();

  factory TestsPositivePercent.fromJson(Map<String, dynamic> json) =>
      _$TestsPositivePercentFromJson(json);

  Map<String, dynamic> toJson() => _$TestsPositivePercentToJson(this);
}
