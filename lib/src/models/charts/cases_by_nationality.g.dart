// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_by_nationality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasesByNationality _$CasesByNationalityFromJson(Map<String, dynamic> json) {
  return CasesByNationality()
    ..foreign = json['foreign'] == null
        ? null
        : Item.fromJson(json['foreign'] as Map<String, dynamic>)
    ..cubans = json['cubans'] == null
        ? null
        : Item.fromJson(json['cubans'] as Map<String, dynamic>)
    ..unknown = json['unknown'] == null
        ? null
        : Item.fromJson(json['unknown'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CasesByNationalityToJson(CasesByNationality instance) =>
    <String, dynamic>{
      'foreign': instance.foreign,
      'cubans': instance.cubans,
      'unknown': instance.unknown,
    };
