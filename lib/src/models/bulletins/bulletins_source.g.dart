// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletins_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulletinsSource _$BulletinsSourceFromJson(Map<String, dynamic> json) {
  return BulletinsSource()
    ..name = json['name'] as String
    ..url = json['url'] as String
    ..dataSource = json['data_source'] as String
    ..bulletins = (json['bulletins'] as List)
        ?.map((e) => e == null
            ? null
            : BulletinsItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BulletinsSourceToJson(BulletinsSource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'data_source': instance.dataSource,
      'bulletins': instance.bulletins,
    };
