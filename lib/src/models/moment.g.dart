// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'moment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentModel _$MomentModelFromJson(Map<String, dynamic> json) {
  return MomentModel()
    ..date = dateTimeFromJson(json['date'] as String)
    ..value = json['value'] as String;
}

Map<String, dynamic> _$MomentModelToJson(MomentModel instance) =>
    <String, dynamic>{
      'date': dateTimeToJson(instance.date),
      'value': instance.value,
    };
