import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'evolution_of_cases_and_recovered_by_days.g.dart';

@JsonSerializable()
class EvolutionOfCasesAndRecoveredByDays {
  ItemList diagnosed;
  ItemList recovered;
  ItemDateList date;

  EvolutionOfCasesAndRecoveredByDays();

  factory EvolutionOfCasesAndRecoveredByDays.fromJson(
          Map<String, dynamic> json) =>
      _$EvolutionOfCasesAndRecoveredByDaysFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EvolutionOfCasesAndRecoveredByDaysToJson(this);
}
