// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipsItem _$TipsItemFromJson(Map<String, dynamic> json) {
  return TipsItem()
    ..header = json['header'] as String
    ..info = json['info'] as String;
}

Map<String, dynamic> _$TipsItemToJson(TipsItem instance) => <String, dynamic>{
      'header': instance.header,
      'info': instance.info,
    };
