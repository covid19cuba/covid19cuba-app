// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipalities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Municipalities _$MunicipalitiesFromJson(Map<String, dynamic> json) {
  return Municipalities()
    ..all = json['all'] == null
        ? null
        : Municipality.fromJson(json['all'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MunicipalitiesToJson(Municipalities instance) =>
    <String, dynamic>{
      'all': instance.all,
    };
