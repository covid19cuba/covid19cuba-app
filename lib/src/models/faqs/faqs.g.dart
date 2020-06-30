// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faqs _$FaqsFromJson(Map<String, dynamic> json) {
  return Faqs()
    ..faqs = (json['faqs'] as List)
        ?.map((e) =>
            e == null ? null : FaqsItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FaqsToJson(Faqs instance) => <String, dynamic>{
      'faqs': instance.faqs,
    };
