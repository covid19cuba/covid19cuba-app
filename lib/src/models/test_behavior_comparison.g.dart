// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'test_behavior_comparison.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestBehaviorComparison _$TestBehaviorComparisonFromJson(
    Map<String, dynamic> json) {
  return TestBehaviorComparison()
    ..name = json['name'] as String
    ..testEffectiveness = (json['test_efectivity'] as num)?.toDouble()
    ..totalTestsPerMillion =
        (json['total_tests_per_million'] as num)?.toDouble()
    ..total = json['total'] as int;
}

Map<String, dynamic> _$TestBehaviorComparisonToJson(
        TestBehaviorComparison instance) =>
    <String, dynamic>{
      'name': instance.name,
      'test_efectivity': instance.testEffectiveness,
      'total_tests_per_million': instance.totalTestsPerMillion,
      'total': instance.total,
    };
