// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'changelog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangelogModel _$ChangelogModelFromJson(Map<String, dynamic> json) {
  return ChangelogModel()
    ..changelog = (json['changelog'] as List)
        ?.map((e) => e == null
            ? null
            : ChangelogItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChangelogModelToJson(ChangelogModel instance) =>
    <String, dynamic>{
      'changelog': instance.changelog,
    };
