import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'evolution_of_deaths_by_days.g.dart';

@JsonSerializable()
class EvolutionOfDeathsByDays {
  ItemList accumulated;
  ItemList daily;
  ItemDateList date;

  EvolutionOfDeathsByDays();

  factory EvolutionOfDeathsByDays.fromJson(Map<String, dynamic> json) =>
      _$EvolutionOfDeathsByDaysFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionOfDeathsByDaysToJson(this);
}
