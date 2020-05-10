// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'item_double_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDoubleList _$ItemDoubleListFromJson(Map<String, dynamic> json) {
  return ItemDoubleList()
    ..name = json['name'] as String
    ..values =
        (json['values'] as List)?.map((e) => (e as num)?.toDouble())?.toList();
}

Map<String, dynamic> _$ItemDoubleListToJson(ItemDoubleList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };
