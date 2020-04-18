// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipalities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MunicipalitiesModel _$MunicipalitiesModelFromJson(Map<String, dynamic> json) {
  return MunicipalitiesModel()
    ..all = json['all'] == null
        ? null
        : MunicipalityModel.fromJson(json['all'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MunicipalitiesModelToJson(
        MunicipalitiesModel instance) =>
    <String, dynamic>{
      'all': instance.all,
    };
