// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'item_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCode _$ItemCodeFromJson(Map<String, dynamic> json) {
  return ItemCode()
    ..code = json['code'] as String
    ..name = json['name'] as String
    ..value = json['value'] as int;
}

Map<String, dynamic> _$ItemCodeToJson(ItemCode instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };
