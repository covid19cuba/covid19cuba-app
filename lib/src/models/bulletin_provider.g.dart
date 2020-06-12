// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'bulletin_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulletinProvider _$BulletinProviderFromJson(Map<String, dynamic> json) {
  return BulletinProvider()
    ..name = json['name'] as String
    ..url = json['url'] as String
    ..data_source = json['data_source'] as String
    ..bulletins = (json['bulletins'] as List)
        ?.map((e) =>
            e == null ? null : Bulletin.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BulletinProviderToJson(BulletinProvider instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'data_source': instance.data_source,
      'bulletins': instance.bulletins,
    };
