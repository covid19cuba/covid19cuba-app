// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleNews _$SimpleNewsFromJson(Map<String, dynamic> json) {
  return SimpleNews(
    date: SimpleNews.dateTimeFromJson(json['timestamp'] as String),
    provider: json['provider'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$SimpleNewsToJson(SimpleNews instance) =>
    <String, dynamic>{
      'timestamp': SimpleNews.dateTimeToJson(instance.date),
      'provider': instance.provider,
      'message': instance.message,
    };

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    news: (json['entries'] as List)
        ?.map((e) =>
            e == null ? null : SimpleNews.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'entries': instance.news,
    };
