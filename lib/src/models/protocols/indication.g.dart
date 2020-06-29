// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Indication _$IndicationFromJson(Map<String, dynamic> json) {
  return Indication()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..abbreviation = json['abbreviation'] as String
    ..category = json['category'] as String
    ..description = json['description'] as String
    ..update = json['update'] as bool
    ..scenarios = (json['scenarios'] as List)
        ?.map((e) =>
            e == null ? null : Scenario.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$IndicationToJson(Indication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbreviation': instance.abbreviation,
      'category': instance.category,
      'description': instance.description,
      'update': instance.update,
      'scenarios': instance.scenarios,
    };
