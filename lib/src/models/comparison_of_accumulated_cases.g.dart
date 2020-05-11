// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'comparison_of_accumulated_cases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComparisonOfAccumulatedCases _$ComparisonOfAccumulatedCasesFromJson(
    Map<String, dynamic> json) {
  return ComparisonOfAccumulatedCases()
    ..countries = (json['data'] as Map<String, dynamic>)?.map(
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
      'data': instance.countries,
      'updated': dateTimeToJson(instance.updated),
    };
