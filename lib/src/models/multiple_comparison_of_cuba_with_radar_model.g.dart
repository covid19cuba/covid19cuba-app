// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_comparison_of_cuba_with_radar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleComparisonOfCubaWithRadarModel
    _$MultipleComparisonOfCubaWithRadarModelFromJson(
        Map<String, dynamic> json) {
  return MultipleComparisonOfCubaWithRadarModel()
    ..data = (json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : RadarItemModel.fromJson(e as Map<String, dynamic>)),
    )
    ..bounds = json['bounds'] == null
        ? null
        : RadarBoundModel.fromJson(json['bounds'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MultipleComparisonOfCubaWithRadarModelToJson(
        MultipleComparisonOfCubaWithRadarModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'bounds': instance.bounds,
    };
