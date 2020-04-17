// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinces_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvincesModel _$ProvincesModelFromJson(Map<String, dynamic> json) {
  return ProvincesModel()
    ..all = json['all'] == null
        ? null
        : ProvinceModel.fromJson(json['all'] as Map<String, dynamic>)
    ..municipalities = (json['municipalities'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : MunicipalitiesModel.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$ProvincesModelToJson(ProvincesModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'municipalities': instance.municipalities,
    };
