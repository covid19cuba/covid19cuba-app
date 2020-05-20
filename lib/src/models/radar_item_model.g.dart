// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'radar_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarItemModel _$RadarItemModelFromJson(Map<String, dynamic> json) {
  return RadarItemModel()
    ..stringency = double.parse(json['stringency'].toString())
    ..deathPercent = double.parse(json['deaths_p'].toString())
    ..recoveredPercent = double.parse(json['recovered_p'].toString())
    ..testPercent = double.parse(json['test_p'].toString())
    ..confirmedPerMillion = double.parse(json['confirmed_per_million'].toString())
    ..testPerMillion = double.parse(json['test_per_million'].toString())
    ..confirmedPerMillionBound = double.parse(json['confirmed_per_million_bound'].toString())
    ..testPerMillionBound = double.parse(json['test_per_million_bound'].toString())
    ..name = json['name'].toString();
}

Map<String, dynamic> _$RadarItemModelToJson(RadarItemModel instance) => <String, dynamic>{
      'stringency': instance.stringency,
      'deaths_p': instance.deathPercent,
      'recovered_p': instance.recoveredPercent,
      'test_p': instance.testPercent,
      'confirmed_per_million': instance.confirmedPerMillion,
      'test_per_million': instance.testPerMillion,
      'confirmed_per_million_bound': instance.confirmedPerMillionBound,
      'test_per_million_bound': instance.testPerMillionBound,
      'name': instance.name,
    };
