// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_by_sex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasesBySex _$CasesBySexFromJson(Map<String, dynamic> json) {
  return CasesBySex()
    ..men = json['men'] == null
        ? null
        : Item.fromJson(json['men'] as Map<String, dynamic>)
    ..women = json['women'] == null
        ? null
        : Item.fromJson(json['women'] as Map<String, dynamic>)
    ..unknown = json['unknown'] == null
        ? null
        : Item.fromJson(json['unknown'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CasesBySexToJson(CasesBySex instance) =>
    <String, dynamic>{
      'men': instance.men,
      'women': instance.women,
      'unknown': instance.unknown,
    };
