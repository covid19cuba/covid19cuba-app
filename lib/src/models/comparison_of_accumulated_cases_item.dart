import 'package:json_annotation/json_annotation.dart';

part 'comparison_of_accumulated_cases_item.g.dart';

@JsonSerializable()
class ComparisonOfAccumulatedCasesItem {
  List<int> confirmed;
  List<int> deaths;
  List<int> recovered;
  List<int> daily;
  List<int> active;
  List<double> stringency;

  ComparisonOfAccumulatedCasesItem();

  factory ComparisonOfAccumulatedCasesItem.fromJson(
          Map<String, dynamic> json) =>
      _$ComparisonOfAccumulatedCasesItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ComparisonOfAccumulatedCasesItemToJson(this);
}
