// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percent_evolution_of_symptomatics_and_asymptomatics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PercentEvolutionSymptomaticsAsymptomatics
    _$PercentEvolutionSymptomaticsAsymptomaticsFromJson(
        Map<String, dynamic> json) {
  return PercentEvolutionSymptomaticsAsymptomatics()
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>)
    ..symptomatics = json['symptomatics'] == null
        ? null
        : ItemDoubleList.fromJson(json['symptomatics'] as Map<String, dynamic>)
    ..asymptomatics = json['asymptomatics'] == null
        ? null
        : ItemDoubleList.fromJson(
            json['asymptomatics'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PercentEvolutionSymptomaticsAsymptomaticsToJson(
        PercentEvolutionSymptomaticsAsymptomatics instance) =>
    <String, dynamic>{
      'date': instance.date,
      'symptomatics': instance.symptomatics,
      'asymptomatics': instance.asymptomatics,
    };
