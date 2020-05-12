// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'jt_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JTNewsModel _$JTNewsModelFromJson(Map<String, dynamic> json) {
  return JTNewsModel()
    ..news = (json['news'] as List)
        ?.map((e) =>
            e == null ? null : JTNewModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$JTNewsModelToJson(JTNewsModel instance) =>
    <String, dynamic>{
      'news': instance.news,
    };
