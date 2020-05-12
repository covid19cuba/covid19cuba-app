// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'tests_positive_percent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestsPositivePercent _$TestsPositivePercentFromJson(Map<String, dynamic> json) {
  return TestsPositivePercent()
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>)
    ..daily = json['daily'] == null
        ? null
        : ItemDoubleList.fromJson(json['daily'] as Map<String, dynamic>)
    ..accumulated = json['accumulated'] == null
        ? null
        : ItemDoubleList.fromJson(json['accumulated'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TestsPositivePercentToJson(
        TestsPositivePercent instance) =>
    <String, dynamic>{
      'date': instance.date,
      'daily': instance.daily,
      'accumulated': instance.accumulated,
    };
