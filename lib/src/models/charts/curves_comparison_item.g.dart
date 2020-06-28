// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curves_comparison_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurvesComparisonItem _$CurvesComparisonItemFromJson(Map<String, dynamic> json) {
  return CurvesComparisonItem()
    ..confirmed = (json['confirmed'] as List)?.map((e) => e as int)?.toList()
    ..deaths = (json['deaths'] as List)?.map((e) => e as int)?.toList()
    ..recovered = (json['recovered'] as List)?.map((e) => e as int)?.toList()
    ..daily = (json['daily'] as List)?.map((e) => e as int)?.toList()
    ..active = (json['active'] as List)?.map((e) => e as int)?.toList()
    ..stringency = (json['stringency'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList()
    ..name = json['name'] as String;
}

Map<String, dynamic> _$CurvesComparisonItemToJson(
        CurvesComparisonItem instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
      'daily': instance.daily,
      'active': instance.active,
      'stringency': instance.stringency,
      'name': instance.name,
    };
