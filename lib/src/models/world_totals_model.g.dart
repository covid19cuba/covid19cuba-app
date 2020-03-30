// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'world_totals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorldTotalsModel _$WorldTotalsModelFromJson(Map<String, dynamic> json) {
  return WorldTotalsModel(
    countries: (json['paises'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as int)?.toList()),
    ),
    dateTime: dateTimeFromJson(json['dia-actualizacion'] as String),
  );
}

Map<String, dynamic> _$WorldTotalsModelToJson(WorldTotalsModel instance) =>
    <String, dynamic>{
      'paises': instance.countries,
      'dia-actualizacion': dateTimeToJson(instance.dateTime),
    };
