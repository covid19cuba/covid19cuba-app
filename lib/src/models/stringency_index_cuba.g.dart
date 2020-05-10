// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'stringency_index_cuba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StringencyIndexCubaModel _$StringencyIndexCubaModelFromJson(
    Map<String, dynamic> json) {
  return StringencyIndexCubaModel()
    ..days = dateTimeListFromJson(json['days'] as List)
    ..data =
        (json['data'] as List)?.map((e) => (e as num)?.toDouble())?.toList()
    ..dataLegacy = (json['data-legacy'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList()
    ..moments = (json['moments'] as List)
        ?.map((e) =>
            e == null ? null : MomentModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$StringencyIndexCubaModelToJson(
        StringencyIndexCubaModel instance) =>
    <String, dynamic>{
      'days': dateTimeListToJson(instance.days),
      'data': instance.data,
      'data-legacy': instance.dataLegacy,
      'moments': instance.moments,
    };
