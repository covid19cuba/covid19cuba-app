// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadsItem _$DownloadsItemFromJson(Map<String, dynamic> json) {
  return DownloadsItem()
    ..name = json['name'] as String
    ..format = json['format'] as String
    ..link = json['link'] as String;
}

Map<String, dynamic> _$DownloadsItemToJson(DownloadsItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'format': instance.format,
      'link': instance.link,
    };
