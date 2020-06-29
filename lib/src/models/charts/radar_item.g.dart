// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarItem _$RadarItemFromJson(Map<String, dynamic> json) {
  return RadarItem()
    ..name = json['name'] as String
    ..confirmedPerMillion = (json['confirmed_per_million'] as num)?.toDouble()
    ..recoveredPercent = (json['recovered_p'] as num)?.toDouble()
    ..testPercent = (json['test_p'] as num)?.toDouble()
    ..deathPercent = (json['deaths_p'] as num)?.toDouble()
    ..stringency = (json['stringency'] as num)?.toDouble()
    ..testPerMillion = (json['test_per_million'] as num)?.toDouble()
    ..confirmedPerMillionBound =
        (json['confirmed_per_million_bound'] as num)?.toDouble()
    ..testPerMillionBound = (json['test_per_million_bound'] as num)?.toDouble();
}

Map<String, dynamic> _$RadarItemToJson(RadarItem instance) => <String, dynamic>{
      'name': instance.name,
      'confirmed_per_million': instance.confirmedPerMillion,
      'recovered_p': instance.recoveredPercent,
      'test_p': instance.testPercent,
      'deaths_p': instance.deathPercent,
      'stringency': instance.stringency,
      'test_per_million': instance.testPerMillion,
      'confirmed_per_million_bound': instance.confirmedPerMillionBound,
      'test_per_million_bound': instance.testPerMillionBound,
    };
