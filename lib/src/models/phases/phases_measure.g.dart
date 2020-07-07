// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phases_measure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhasesMeasure _$PhasesMeasureFromJson(Map<String, dynamic> json) {
  return PhasesMeasure()
    ..text = json['text'] as String
    ..category = json['category'] as String
    ..phases = (json['phases'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$PhasesMeasureToJson(PhasesMeasure instance) =>
    <String, dynamic>{
      'text': instance.text,
      'category': instance.category,
      'phases': instance.phases,
    };
