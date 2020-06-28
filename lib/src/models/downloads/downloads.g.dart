// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Downloads _$DownloadsFromJson(Map<String, dynamic> json) {
  return Downloads()
    ..downloads = (json['downloads'] as List)
        ?.map((e) => e == null
            ? null
            : DownloadsItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DownloadsToJson(Downloads instance) => <String, dynamic>{
      'downloads': instance.downloads,
    };
