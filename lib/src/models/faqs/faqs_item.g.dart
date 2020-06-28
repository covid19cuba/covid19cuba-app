// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqsItem _$FaqsItemFromJson(Map<String, dynamic> json) {
  return FaqsItem()
    ..title = json['title'] as String
    ..body = json['body'] as String;
}

Map<String, dynamic> _$FaqsItemToJson(FaqsItem instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
