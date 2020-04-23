// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stringency_index_cuba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StringencyIndexCubaModel _$StringencyIndexCubaModelFromJson(
    Map<String, dynamic> json) {
  return StringencyIndexCubaModel()
    ..days = dateTimeListFromJson(json['days'] as List)
    ..data =
        (json['data'] as List)?.map((e) => (e as num)?.toDouble())?.toList()
    ..moments = (json['moments'] as List)
        ?.map((e) =>
            e == null ? null : MomentModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$StringencyIndexCubaModelToJson(
        StringencyIndexCubaModel instance) =>
    <String, dynamic>{
      'days': dateTimeListToJson(instance.days),
      'data': instance.data,
      'moments': instance.moments,
    };
