import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'tests_by_days.g.dart';

@JsonSerializable()
class TestsByDays {
  ItemDateList date;
  ItemList negative;
  ItemList positive;
  ItemList total;

  TestsByDays();

  factory TestsByDays.fromJson(Map<String, dynamic> json) =>
      _$TestsByDaysFromJson(json);

  Map<String, dynamic> toJson() => _$TestsByDaysToJson(this);
}
