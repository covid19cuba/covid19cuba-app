// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_code_plus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCodePlus _$ItemCodePlusFromJson(Map<String, dynamic> json) {
  return ItemCodePlus()
    ..code = json['code'] as String
    ..name = json['name'] as String
    ..value = json['value'] as int
    ..men = json['men'] as int
    ..women = json['women'] as int
    ..unknown = json['unknown'] as int;
}

Map<String, dynamic> _$ItemCodePlusToJson(ItemCodePlus instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
      'men': instance.men,
      'women': instance.women,
      'unknown': instance.unknown,
    };
