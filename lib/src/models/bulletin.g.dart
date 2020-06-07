// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bulletin _$BulletinFromJson(Map<String, dynamic> json) {
  return Bulletin()
    ..id = json['id'] as String
    ..info = json['info'] as String
    ..url = json['url'] as String
    ..size = json['size'] as int;
}

Map<String, dynamic> _$BulletinToJson(Bulletin instance) => <String, dynamic>{
      'id': instance.id,
      'info': instance.info,
      'url': instance.url,
      'size': instance.size,
    };
