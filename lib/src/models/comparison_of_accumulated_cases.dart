import 'package:covid19cuba/src/models/comparison_of_accumulated_cases_item.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/utils/utils.dart';

part 'comparison_of_accumulated_cases.g.dart';

@JsonSerializable()
class ComparisonOfAccumulatedCases {
  @JsonKey(name: 'countries_info')
  Map<String, ComparisonOfAccumulatedCasesItem> countries;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime updated;

  ComparisonOfAccumulatedCases();

  factory ComparisonOfAccumulatedCases.fromJson(Map<String, dynamic> json) =>
      _$ComparisonOfAccumulatedCasesFromJson(json);

  Map<String, dynamic> toJson() => _$ComparisonOfAccumulatedCasesToJson(this);
}
