// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison_of_accumulated_cases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComparisonOfAccumulatedCases _$ComparisonOfAccumulatedCasesFromJson(
    Map<String, dynamic> json) {
  return ComparisonOfAccumulatedCases()
    ..countries = (json['countries_info'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ComparisonOfAccumulatedCasesItem.fromJson(
                  e as Map<String, dynamic>)),
    )
    ..updated = dateTimeFromJson(json['updated'] as String);
}

Map<String, dynamic> _$ComparisonOfAccumulatedCasesToJson(
        ComparisonOfAccumulatedCases instance) =>
    <String, dynamic>{
      'countries_info': instance.countries,
      'updated': dateTimeToJson(instance.updated),
    };
