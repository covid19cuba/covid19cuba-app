// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scenario _$ScenarioFromJson(Map<String, dynamic> json) {
  return Scenario()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..shortname = json['shortname'] as String
    ..abbreviation = json['abbreviation'] as String
    ..order = json['order'] as int
    ..update = json['update'] as bool
    ..details = (json['details'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ScenarioToJson(Scenario instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortname': instance.shortname,
      'abbreviation': instance.abbreviation,
      'order': instance.order,
      'update': instance.update,
      'details': instance.details,
    };
