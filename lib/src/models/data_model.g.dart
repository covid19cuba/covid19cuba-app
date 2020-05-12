// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return DataModel()
    ..all = json['all'] == null
        ? null
        : CubaModel.fromJson(json['all'] as Map<String, dynamic>)
    ..provinces = (json['provinces'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ProvincesModel.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'all': instance.all,
      'provinces': instance.provinces,
    };
