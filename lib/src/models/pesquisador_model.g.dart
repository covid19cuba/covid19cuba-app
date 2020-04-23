// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisador_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PesquisadorModel _$PesquisadorModelFromJson(Map<String, dynamic> json) {
  return PesquisadorModel()
    ..url = json['url'] as String
    ..javascript = json['javascript'] as String
    ..contains = json['contains'] as String;
}

Map<String, dynamic> _$PesquisadorModelToJson(PesquisadorModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'javascript': instance.javascript,
      'contains': instance.contains,
    };
