// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison_of_accumulated_cases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComparisonOfAccumulatedCases _$ComparisonOfAccumulatedCasesFromJson(
    Map<String, dynamic> json) {
  return ComparisonOfAccumulatedCases()
    ..countries = (json['countries'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as int)?.toList()),
    )
    ..updated = dateTimeFromJson(json['updated'] as String);
}

Map<String, dynamic> _$ComparisonOfAccumulatedCasesToJson(
        ComparisonOfAccumulatedCases instance) =>
    <String, dynamic>{
      'countries': instance.countries,
      'updated': dateTimeToJson(instance.updated),
    };
