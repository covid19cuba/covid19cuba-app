// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'radar_bound_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarBoundModel _$RadarBoundModelFromJson(Map<String, dynamic> json) {
  return RadarBoundModel()
    ..stringency = double.parse(json['stringency'].toString())
    ..deathPercent = double.parse(json['deaths_p'].toString())
    ..recoveredPercent = double.parse(json['recovered_p'].toString())
    ..testPercent = double.parse(json['test_p'].toString());
}

Map<String, dynamic> _$RadarBoundModelToJson(RadarBoundModel instance) => <String, dynamic>{
      'stringency': instance.stringency,
      'deaths_p': instance.deathPercent,
      'recovered_p': instance.recoveredPercent,
      'test_p': instance.testPercent,
    };
