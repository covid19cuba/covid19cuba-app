// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel()
    ..news = (json['news'] as List)
        ?.map((e) =>
            e == null ? null : NewModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'news': instance.news,
    };
