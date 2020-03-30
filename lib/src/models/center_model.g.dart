// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterModel _$CenterModelFromJson(Map<String, dynamic> json) {
  return CenterModel(
    id: json['id'] as String,
    name: json['nombre'] as String,
    province: json['provincia'] as String,
    dpacodeProvince: json['dpacode_provincia'] as String,
  );
}

Map<String, dynamic> _$CenterModelToJson(CenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.name,
      'provincia': instance.province,
      'dpacode_provincia': instance.dpacodeProvince,
    };
