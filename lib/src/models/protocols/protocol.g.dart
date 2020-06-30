// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Protocol _$ProtocolFromJson(Map<String, dynamic> json) {
  return Protocol()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..link = json['link'] as String
    ..version = json['version'] as int
    ..date = dateTimeFromJson(json['date'] as String)
    ..indications = (json['indications'] as List)
        ?.map((e) =>
            e == null ? null : Indication.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ProtocolToJson(Protocol instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'version': instance.version,
      'date': dateTimeToJson(instance.date),
      'indications': instance.indications,
    };
