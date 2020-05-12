// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'item_date_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDateList _$ItemDateListFromJson(Map<String, dynamic> json) {
  return ItemDateList()
    ..name = json['name'] as String
    ..values = dateTimeListFromJson(json['values'] as List);
}

Map<String, dynamic> _$ItemDateListToJson(ItemDateList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': dateTimeListToJson(instance.values),
    };
