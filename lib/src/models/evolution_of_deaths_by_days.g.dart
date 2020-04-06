// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_of_deaths_by_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionOfDeathsByDays _$EvolutionOfDeathsByDaysFromJson(
    Map<String, dynamic> json) {
  return EvolutionOfDeathsByDays()
    ..accumulated = json['accumulated'] == null
        ? null
        : ItemList.fromJson(json['accumulated'] as Map<String, dynamic>)
    ..daily = json['daily'] == null
        ? null
        : ItemList.fromJson(json['daily'] as Map<String, dynamic>)
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EvolutionOfDeathsByDaysToJson(
        EvolutionOfDeathsByDays instance) =>
    <String, dynamic>{
      'accumulated': instance.accumulated,
      'daily': instance.daily,
      'date': instance.date,
    };
