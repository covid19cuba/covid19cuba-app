// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_comparison_with_radar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleComparisonWithRadar _$MultipleComparisonWithRadarFromJson(
    Map<String, dynamic> json) {
  return MultipleComparisonWithRadar()
    ..data = (json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : RadarItem.fromJson(e as Map<String, dynamic>)),
    )
    ..bounds = json['bounds'] == null
        ? null
        : RadarBound.fromJson(json['bounds'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MultipleComparisonWithRadarToJson(
        MultipleComparisonWithRadar instance) =>
    <String, dynamic>{
      'data': instance.data,
      'bounds': instance.bounds,
    };
