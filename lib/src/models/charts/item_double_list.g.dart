// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_double_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDoubleList _$ItemDoubleListFromJson(Map<String, dynamic> json) {
  return ItemDoubleList()
    ..name = json['name'] as String
    ..values =
        (json['values'] as List)?.map((e) => (e as num)?.toDouble())?.toList();
}

Map<String, dynamic> _$ItemDoubleListToJson(ItemDoubleList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };
