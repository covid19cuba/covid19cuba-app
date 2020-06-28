// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_string_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemStringList _$ItemStringListFromJson(Map<String, dynamic> json) {
  return ItemStringList()
    ..name = json['name'] as String
    ..values = (json['values'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ItemStringListToJson(ItemStringList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };
