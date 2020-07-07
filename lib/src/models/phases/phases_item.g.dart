// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phases_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhasesItem _$PhasesItemFromJson(Map<String, dynamic> json) {
  return PhasesItem()
    ..order = json['order'] as int
    ..name = json['name'] as String
    ..provinces = (json['provinces'] as List)?.map((e) => e as String)?.toList()
    ..measures = (json['measures'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$PhasesItemToJson(PhasesItem instance) =>
    <String, dynamic>{
      'order': instance.order,
      'name': instance.name,
      'provinces': instance.provinces,
      'measures': instance.measures,
    };
