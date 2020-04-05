// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurationModel _$ConfigurationModelFromJson(Map<String, dynamic> json) {
  return ConfigurationModel(
    compareCountry: json[Constants.prefCompareCountry] as String,
  );
}

Map<String, dynamic> _$ConfigurationModelToJson(ConfigurationModel instance) =>
    <String, dynamic>{
      Constants.prefCompareCountry: instance.compareCountry,
    };
