// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_of_symptomatics_and_asymptomatics_by_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionSymptomaticsAsymptomaticsDays
    _$EvolutionSymptomaticsAsymptomaticsDaysFromJson(
        Map<String, dynamic> json) {
  return EvolutionSymptomaticsAsymptomaticsDays()
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>)
    ..symptomatics = json['symptomatics'] == null
        ? null
        : ItemList.fromJson(json['symptomatics'] as Map<String, dynamic>)
    ..asymptomatics = json['asymptomatics'] == null
        ? null
        : ItemList.fromJson(json['asymptomatics'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EvolutionSymptomaticsAsymptomaticsDaysToJson(
        EvolutionSymptomaticsAsymptomaticsDays instance) =>
    <String, dynamic>{
      'date': instance.date,
      'symptomatics': instance.symptomatics,
      'asymptomatics': instance.asymptomatics,
    };
