// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurationModel _$ConfigurationModelFromJson(Map<String, dynamic> json) {
  return ConfigurationModel(
    compare_country: json['pais_comparar'] as String,
  );
}

Map<String, dynamic> _$ConfigurationModelToJson(ConfigurationModel instance) =>
    <String, dynamic>{
      'pais_comparar': instance.compare_country,
    };
