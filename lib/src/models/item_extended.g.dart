// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'item_extended.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemExtended _$ItemExtendedFromJson(Map<String, dynamic> json) {
  return ItemExtended()
    ..name = json['name'] as String
    ..value = json['value'] as int
    ..confirmed = json['confirmed'] as int
    ..recovered = json['recovered'] as int
    ..deaths = json['deaths'] as int;
}

Map<String, dynamic> _$ItemExtendedToJson(ItemExtended instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'confirmed': instance.confirmed,
      'recovered': instance.recovered,
      'deaths': instance.deaths,
    };
