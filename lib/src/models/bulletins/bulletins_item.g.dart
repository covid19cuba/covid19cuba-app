// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletins_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulletinsItem _$BulletinsItemFromJson(Map<String, dynamic> json) {
  return BulletinsItem()
    ..id = json['id'] as String
    ..info = json['info'] as String
    ..url = json['url'] as String
    ..size = (json['size'] as num)?.toDouble();
}

Map<String, dynamic> _$BulletinsItemToJson(BulletinsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'info': instance.info,
      'url': instance.url,
      'size': instance.size,
    };
