// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stringency_index_cuba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StringencyIndexCuba _$StringencyIndexCubaFromJson(Map<String, dynamic> json) {
  return StringencyIndexCuba()
    ..days = dateTimeListFromJson(json['days'] as List)
    ..data =
        (json['data'] as List)?.map((e) => (e as num)?.toDouble())?.toList()
    ..dataLegacy = (json['data-legacy'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList()
    ..moments = (json['moments'] as List)
        ?.map((e) =>
            e == null ? null : Moment.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$StringencyIndexCubaToJson(
        StringencyIndexCuba instance) =>
    <String, dynamic>{
      'days': dateTimeListToJson(instance.days),
      'data': instance.data,
      'data-legacy': instance.dataLegacy,
      'moments': instance.moments,
    };
