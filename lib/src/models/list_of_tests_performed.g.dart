// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'list_of_tests_performed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfTestsPerformed _$ListOfTestsPerformedFromJson(Map<String, dynamic> json) {
  return ListOfTestsPerformed()
    ..positive = json['positive'] == null
        ? null
        : Item.fromJson(json['positive'] as Map<String, dynamic>)
    ..negative = json['negative'] == null
        ? null
        : Item.fromJson(json['negative'] as Map<String, dynamic>)
    ..total = json['total'] == null
        ? null
        : Item.fromJson(json['total'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ListOfTestsPerformedToJson(
        ListOfTestsPerformed instance) =>
    <String, dynamic>{
      'positive': instance.positive,
      'negative': instance.negative,
      'total': instance.total,
    };
