// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'radar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarModel _$RadarModelFromJson(Map<String, dynamic> json) {
  return RadarModel()
    ..bounds = json['bounds'] == null
        ? null
        : RadarBoundModel.fromJson(json['bounds'] as Map<String, dynamic>)
    ..data = (json['data'] as Map<String, dynamic>)?.map((k, e) => MapEntry(
          k,
          e == null ? null : RadarItemModel.fromJson(e as Map<String, dynamic>),
        ));
}

Map<String, dynamic> _$RadarModelToJson(RadarModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'bounds': instance.bounds,
    };
