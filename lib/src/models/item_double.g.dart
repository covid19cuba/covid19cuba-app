// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_double.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDouble _$ItemDoubleFromJson(Map<String, dynamic> json) {
  return ItemDouble()
    ..name = json['name'] as String
    ..value = (json['value'] as num)?.toDouble();
}

Map<String, dynamic> _$ItemDoubleToJson(ItemDouble instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
