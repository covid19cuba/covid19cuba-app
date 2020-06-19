// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'bulletin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bulletin _$BulletinFromJson(Map<String, dynamic> json) {
  return Bulletin()
    ..id = json['id'] as String
    ..info = json['info'] as String
    ..url = json['url'] as String
    ..size = json['size'] as double;
}

Map<String, dynamic> _$BulletinToJson(Bulletin instance) => <String, dynamic>{
      'id': instance.id,
      'info': instance.info,
      'url': instance.url,
      'size': instance.size,
    };
