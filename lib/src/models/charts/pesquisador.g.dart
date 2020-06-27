// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisador.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pesquisador _$PesquisadorFromJson(Map<String, dynamic> json) {
  return Pesquisador()
    ..url = json['url'] as String
    ..javascript = json['javascript'] as String
    ..contains = json['contains'] as String;
}

Map<String, dynamic> _$PesquisadorToJson(Pesquisador instance) =>
    <String, dynamic>{
      'url': instance.url,
      'javascript': instance.javascript,
      'contains': instance.contains,
    };
