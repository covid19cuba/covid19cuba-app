// GENERATED CODE - DO NOT MODIFY BY HAND

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
