// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

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
