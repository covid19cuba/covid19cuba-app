// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'item_string_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemStringList _$ItemStringListFromJson(Map<String, dynamic> json) {
  return ItemStringList()
    ..name = json['name'] as String
    ..values = (json['values'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ItemStringListToJson(ItemStringList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };
