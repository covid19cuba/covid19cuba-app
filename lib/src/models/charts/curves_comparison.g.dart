// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curves_comparison.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurvesComparison _$CurvesComparisonFromJson(Map<String, dynamic> json) {
  return CurvesComparison()
    ..countries = (json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CurvesComparisonItem.fromJson(e as Map<String, dynamic>)),
    )
    ..updated = dateTimeFromJson(json['updated'] as String);
}

Map<String, dynamic> _$CurvesComparisonToJson(CurvesComparison instance) =>
    <String, dynamic>{
      'data': instance.countries,
      'updated': dateTimeToJson(instance.updated),
    };
