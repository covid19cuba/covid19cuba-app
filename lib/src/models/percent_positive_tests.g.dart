// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percent_positive_tests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PercentPositiveTests _$PercentPositiveTestsFromJson(Map<String, dynamic> json) {
  return PercentPositiveTests()
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

Map<String, dynamic> _$PercentPositiveTestsToJson(
        PercentPositiveTests instance) =>
    <String, dynamic>{
      'date': instance.date,
      'daily': instance.daily,
      'accumulated': instance.accumulated,
    };
