// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curves_comparison.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurvesComparisonModel _$CurvesComparisonModelFromJson(
    Map<String, dynamic> json) {
  return CurvesComparisonModel()
    ..countries = (json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CurvesComparisonModelItem.fromJson(e as Map<String, dynamic>)),
    )
    ..updated = dateTimeFromJson(json['updated'] as String);
}

Map<String, dynamic> _$CurvesComparisonModelToJson(
        CurvesComparisonModel instance) =>
    <String, dynamic>{
      'data': instance.countries,
      'updated': dateTimeToJson(instance.updated),
    };
