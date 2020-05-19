// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_of_active_and_recovered_accumulated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionOfActiveAndRecoveredAccumulated
    _$EvolutionOfActiveAndRecoveredAccumulatedFromJson(
        Map<String, dynamic> json) {
  return EvolutionOfActiveAndRecoveredAccumulated()
    ..active = json['active'] == null
        ? null
        : ItemList.fromJson(json['active'] as Map<String, dynamic>)
    ..recovered = json['recovered'] == null
        ? null
        : ItemList.fromJson(json['recovered'] as Map<String, dynamic>)
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EvolutionOfActiveAndRecoveredAccumulatedToJson(
        EvolutionOfActiveAndRecoveredAccumulated instance) =>
    <String, dynamic>{
      'active': instance.active,
      'recovered': instance.recovered,
      'date': instance.date,
    };
