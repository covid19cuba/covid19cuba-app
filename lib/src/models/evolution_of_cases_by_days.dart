import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'evolution_of_cases_by_days.g.dart';

@JsonSerializable()
class EvolutionOfCasesByDays {
  ItemList accumulated;
  ItemList daily;
  ItemList active;
  ItemDateList date;

  EvolutionOfCasesByDays();

  factory EvolutionOfCasesByDays.fromJson(Map<String, dynamic> json) =>
      _$EvolutionOfCasesByDaysFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionOfCasesByDaysToJson(this);
}
