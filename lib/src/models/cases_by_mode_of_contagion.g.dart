// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'cases_by_mode_of_contagion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasesByModeOfContagion _$CasesByModeOfContagionFromJson(
    Map<String, dynamic> json) {
  return CasesByModeOfContagion()
    ..imported = json['imported'] == null
        ? null
        : Item.fromJson(json['imported'] as Map<String, dynamic>)
    ..inserted = json['inserted'] == null
        ? null
        : Item.fromJson(json['inserted'] as Map<String, dynamic>)
    ..autochthonous = json['autochthonous'] == null
        ? null
        : Item.fromJson(json['autochthonous'] as Map<String, dynamic>)
    ..unknown = json['unknown'] == null
        ? null
        : Item.fromJson(json['unknown'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CasesByModeOfContagionToJson(
        CasesByModeOfContagion instance) =>
    <String, dynamic>{
      'imported': instance.imported,
      'inserted': instance.inserted,
      'autochthonous': instance.autochthonous,
      'unknown': instance.unknown,
    };
