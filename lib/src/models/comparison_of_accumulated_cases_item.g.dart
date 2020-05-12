// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'comparison_of_accumulated_cases_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComparisonOfAccumulatedCasesItem _$ComparisonOfAccumulatedCasesItemFromJson(
    Map<String, dynamic> json) {
  return ComparisonOfAccumulatedCasesItem()
    ..confirmed = (json['confirmed'] as List)?.map((e) => e as int)?.toList()
    ..deaths = (json['deaths'] as List)?.map((e) => e as int)?.toList()
    ..recovered = (json['recovered'] as List)?.map((e) => e as int)?.toList()
    ..daily = (json['daily'] as List)?.map((e) => e as int)?.toList()
    ..active = (json['active'] as List)?.map((e) => e as int)?.toList()
    ..stringency = (json['stringency'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList()
    ..name = json['name'] as String;
}

Map<String, dynamic> _$ComparisonOfAccumulatedCasesItemToJson(
        ComparisonOfAccumulatedCasesItem instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
      'daily': instance.daily,
      'active': instance.active,
      'stringency': instance.stringency,
      'name': instance.name,
    };
