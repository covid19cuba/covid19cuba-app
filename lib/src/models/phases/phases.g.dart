// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phases _$PhasesFromJson(Map<String, dynamic> json) {
  return Phases()
    ..phases = (json['phases'] as List)
        ?.map((e) =>
            e == null ? null : PhasesItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..categories = (json['categories'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : PhasesCategory.fromJson(e as Map<String, dynamic>)),
    )
    ..measures = (json['measures'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : PhasesMeasure.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$PhasesToJson(Phases instance) => <String, dynamic>{
      'phases': instance.phases,
      'categories': instance.categories,
      'measures': instance.measures,
    };
