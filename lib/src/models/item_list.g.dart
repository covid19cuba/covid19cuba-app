// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemList _$ItemListFromJson(Map<String, dynamic> json) {
  return ItemList()
    ..name = json['name'] as String
    ..values = (json['values'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$ItemListToJson(ItemList instance) => <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };
