// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'cases_by_sex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasesBySex _$CasesBySexFromJson(Map<String, dynamic> json) {
  return CasesBySex()
    ..men = json['men'] == null
        ? null
        : Item.fromJson(json['men'] as Map<String, dynamic>)
    ..women = json['women'] == null
        ? null
        : Item.fromJson(json['women'] as Map<String, dynamic>)
    ..unknown = json['unknown'] == null
        ? null
        : Item.fromJson(json['unknown'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CasesBySexToJson(CasesBySex instance) =>
    <String, dynamic>{
      'men': instance.men,
      'women': instance.women,
      'unknown': instance.unknown,
    };
