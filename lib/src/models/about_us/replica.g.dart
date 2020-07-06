// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replica.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Replica _$ReplicaFromJson(Map<String, dynamic> json) {
  return Replica()
    ..text = json['text'] as String
    ..url = json['url'] as String
    ..replicaUrl = json['replicaUrl'] as String;
}

Map<String, dynamic> _$ReplicaToJson(Replica instance) => <String, dynamic>{
      'text': instance.text,
      'url': instance.url,
      'replicaUrl': instance.replicaUrl,
    };
