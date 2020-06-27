// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_of_cases_and_recovered_by_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionOfCasesAndRecoveredByDays _$EvolutionOfCasesAndRecoveredByDaysFromJson(
    Map<String, dynamic> json) {
  return EvolutionOfCasesAndRecoveredByDays()
    ..diagnosed = json['diagnosed'] == null
        ? null
        : ItemList.fromJson(json['diagnosed'] as Map<String, dynamic>)
    ..recovered = json['recovered'] == null
        ? null
        : ItemList.fromJson(json['recovered'] as Map<String, dynamic>)
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EvolutionOfCasesAndRecoveredByDaysToJson(
        EvolutionOfCasesAndRecoveredByDays instance) =>
    <String, dynamic>{
      'diagnosed': instance.diagnosed,
      'recovered': instance.recovered,
      'date': instance.date,
    };
