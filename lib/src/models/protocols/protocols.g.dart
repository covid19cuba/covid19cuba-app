// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocols.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Protocols _$ProtocolsFromJson(Map<String, dynamic> json) {
  return Protocols()
    ..protocols = (json['protocols'] as List)
        ?.map((e) =>
            e == null ? null : Protocol.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ProtocolsToJson(Protocols instance) => <String, dynamic>{
      'protocols': instance.protocols,
    };
