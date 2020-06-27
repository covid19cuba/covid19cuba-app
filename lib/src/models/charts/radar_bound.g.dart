// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar_bound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarBound _$RadarBoundFromJson(Map<String, dynamic> json) {
  return RadarBound()
    ..stringency = (json['stringency'] as num)?.toDouble()
    ..deathPercent = (json['deaths_p'] as num)?.toDouble()
    ..recoveredPercent = (json['recovered_p'] as num)?.toDouble()
    ..testPercent = (json['test_p'] as num)?.toDouble();
}

Map<String, dynamic> _$RadarBoundToJson(RadarBound instance) =>
    <String, dynamic>{
      'stringency': instance.stringency,
      'deaths_p': instance.deathPercent,
      'recovered_p': instance.recoveredPercent,
      'test_p': instance.testPercent,
    };
