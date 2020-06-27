// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News()
    ..news = (json['news'] as List)
        ?.map((e) =>
            e == null ? null : NewsItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'news': instance.news,
    };
