import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'distribution_of_cases.g.dart';

@JsonSerializable()
class DistributionOfCases {
  Item recovered;
  Item active;
  Item evacuees;
  Item deaths;
  Item cases;

  DistributionOfCases();

  factory DistributionOfCases.fromJson(Map<String, dynamic> json) =>
      _$DistributionOfCasesFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionOfCasesToJson(this);
}
