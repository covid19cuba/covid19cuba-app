// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percent_of_symptomatics_and_asymptomatics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PercentSymptomaticsAsymptomatics _$PercentSymptomaticsAsymptomaticsFromJson(
    Map<String, dynamic> json) {
  return PercentSymptomaticsAsymptomatics()
    ..symptomatics = json['symptomatics'] == null
        ? null
        : ItemDouble.fromJson(json['symptomatics'] as Map<String, dynamic>)
    ..asymptomatics = json['asymptomatics'] == null
        ? null
        : ItemDouble.fromJson(json['asymptomatics'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PercentSymptomaticsAsymptomaticsToJson(
        PercentSymptomaticsAsymptomatics instance) =>
    <String, dynamic>{
      'symptomatics': instance.symptomatics,
      'asymptomatics': instance.asymptomatics,
    };
