// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'radar_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarData _$RadarDataFromJson(Map<String, dynamic> json) {
  return RadarData()
    ..name = json['name']
    ..deathPercent = json['deaths_p']
    ..recoveredPercent = json['recovered_p']
    ..testPercent = json['test_p']
    ..stringency = json['stringency']
    ..testPerMillion = json['test_per_million']
    ..confirmedPerMillion = json['confirmed_per_million']
    ..confirmedPerMillionBound = json['confirmed_per_million_bound']
    ..testPerMillionBound = json['test_per_million_bound'];
}

Map<String, dynamic> _$RadarDataToJson(RadarData instance) => <String, dynamic>{
      'name': instance.name,
      'deaths_p': instance.deathPercent,
      'recovered_p': instance.recoveredPercent,
      'test_p': instance.testPercent,
      'stringency': instance.stringency,
      'test_per_million': instance.testPerMillion,
      'confirmed_per_million': instance.confirmedPerMillion,
      'confirmed_per_million_bound': instance.confirmedPerMillionBound,
      'test_per_million_bound': instance.testPerMillionBound,
    };
