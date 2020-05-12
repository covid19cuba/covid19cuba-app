// GENERATED CODE - DO NOT MODIFY BY HAND

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
