// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'item_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemProvince _$ItemProvinceFromJson(Map<String, dynamic> json) {
  return ItemProvince()
    ..value = json['value'] as int
    ..name = json['name'] as String
    ..total = json['total'] as int
    ..population = json['population'] as int;
}

Map<String, dynamic> _$ItemProvinceToJson(ItemProvince instance) =>
    <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'total': instance.total,
      'population': instance.population,
    };
