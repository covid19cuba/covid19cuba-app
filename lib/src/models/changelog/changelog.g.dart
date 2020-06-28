// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changelog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Changelog _$ChangelogFromJson(Map<String, dynamic> json) {
  return Changelog()
    ..changelog = (json['changelog'] as List)
        ?.map((e) => e == null
            ? null
            : ChangelogItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChangelogToJson(Changelog instance) => <String, dynamic>{
      'changelog': instance.changelog,
    };
