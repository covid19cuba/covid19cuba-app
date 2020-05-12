// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

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
