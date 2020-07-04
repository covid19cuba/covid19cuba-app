// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) {
  return NewsItem()
    ..id = json['id'] as String
    ..link = json['link'] as String
    ..title = json['title'] as String
    ..author = json['author'] as String
    ..published = (json['published'] as List)?.map((e) => e as int)?.toList()
    ..updated = (json['updated'] as List)?.map((e) => e as int)?.toList()
    ..summary = json['summary'] as String
    ..abstract = json['abstract'] as String
    ..abstractStr = json['abstract_str'] as String
    ..source = json['source'] as String;
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'title': instance.title,
      'author': instance.author,
      'published': instance.published,
      'updated': instance.updated,
      'summary': instance.summary,
      'abstract': instance.abstract,
      'abstract_str': instance.abstractStr,
      'source': instance.source,
    };
