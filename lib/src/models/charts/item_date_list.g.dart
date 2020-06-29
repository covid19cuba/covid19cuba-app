// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_date_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDateList _$ItemDateListFromJson(Map<String, dynamic> json) {
  return ItemDateList()
    ..name = json['name'] as String
    ..values = dateTimeListFromJson(json['values'] as List);
}

Map<String, dynamic> _$ItemDateListToJson(ItemDateList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': dateTimeListToJson(instance.values),
    };
