// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'evolution_of_cases_by_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionOfCasesByDays _$EvolutionOfCasesByDaysFromJson(
    Map<String, dynamic> json) {
  return EvolutionOfCasesByDays()
    ..accumulated = json['accumulated'] == null
        ? null
        : ItemList.fromJson(json['accumulated'] as Map<String, dynamic>)
    ..daily = json['daily'] == null
        ? null
        : ItemList.fromJson(json['daily'] as Map<String, dynamic>)
    ..active = json['active'] == null
        ? null
        : ItemList.fromJson(json['active'] as Map<String, dynamic>)
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EvolutionOfCasesByDaysToJson(
        EvolutionOfCasesByDays instance) =>
    <String, dynamic>{
      'accumulated': instance.accumulated,
      'daily': instance.daily,
      'active': instance.active,
      'date': instance.date,
    };
