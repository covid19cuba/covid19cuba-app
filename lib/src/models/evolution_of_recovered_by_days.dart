import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'evolution_of_recovered_by_days.g.dart';

@JsonSerializable()
class EvolutionOfRecoveredByDays {
  ItemList accumulated;
  ItemList daily;
  ItemDateList date;

  EvolutionOfRecoveredByDays();

  factory EvolutionOfRecoveredByDays.fromJson(Map<String, dynamic> json) =>
      _$EvolutionOfRecoveredByDaysFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionOfRecoveredByDaysToJson(this);
}
