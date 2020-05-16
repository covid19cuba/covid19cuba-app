// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'radar_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarDataModel _$RadarDataModelFromJson(Map<String, dynamic> json) {
  return RadarDataModel()
    ..bounds = json['bounds'] == null
        ? null
        : RadarBound.fromJson(json['bounds'] as Map<String, dynamic>)
    ..data = (json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : RadarData.fromJson(e as Map<String, dynamic>)),
    )
    ..countries = (json['data'] as Map<String, dynamic>)?.keys.toList()
    ..countries.sort();
}

Map<String, dynamic> _$RadarDataModelToJson(RadarDataModel instance) => <String, dynamic>{
      'bounds': instance.bounds,
      'data': instance.data,
    };
