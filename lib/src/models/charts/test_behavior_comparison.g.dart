// GENERATED CODE - DO NOT MODIFY BY HAND

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
