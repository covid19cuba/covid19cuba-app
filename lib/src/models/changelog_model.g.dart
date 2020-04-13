// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changelog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangelogModel _$ChangelogModelFromJson(Map<String, dynamic> json) {
  return ChangelogModel()
    ..changelog = (json['changelog'] as List)
        ?.map((e) => e == null
            ? null
            : ChangelogItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChangelogModelToJson(ChangelogModel instance) =>
    <String, dynamic>{
      'changelog': instance.changelog,
    };
