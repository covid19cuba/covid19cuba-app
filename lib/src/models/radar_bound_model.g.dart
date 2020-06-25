// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar_bound_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarBoundModel _$RadarBoundModelFromJson(Map<String, dynamic> json) {
  return RadarBoundModel()
    ..stringency = (json['stringency'] as num)?.toDouble()
    ..deathPercent = (json['deaths_p'] as num)?.toDouble()
    ..recoveredPercent = (json['recovered_p'] as num)?.toDouble()
    ..testPercent = (json['test_p'] as num)?.toDouble();
}

Map<String, dynamic> _$RadarBoundModelToJson(RadarBoundModel instance) =>
    <String, dynamic>{
      'stringency': instance.stringency,
      'deaths_p': instance.deathPercent,
      'recovered_p': instance.recoveredPercent,
      'test_p': instance.testPercent,
    };
