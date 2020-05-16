// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'radar_bound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarBound _$RadarBoundFromJson(Map<String, dynamic> json) {
  return RadarBound()
    ..stringency = json['stringency']
    ..deathsPercent = json['deaths_p']
    ..recoveredPercent = json['recovered_p']
    ..testPercent = json['test_p'];
}

Map<String, dynamic> _$RadarBoundToJson(RadarBound instance) => <String, dynamic>{
      'stringency': instance.stringency,
      'deaths_p': instance.deathsPercent,
      'recovered_p': instance.recoveredPercent,
      'test_p': instance.testPercent,
    };
