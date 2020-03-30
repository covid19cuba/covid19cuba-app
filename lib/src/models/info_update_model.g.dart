// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUpdate _$InfoUpdateFromJson(Map<String, dynamic> json) {
  return InfoUpdate(
    needUpdate: json['needUpdate'] as bool ?? false,
    date: InfoUpdate.dateTimeFromJson(json['updated'] as String),
  );
}

Map<String, dynamic> _$InfoUpdateToJson(InfoUpdate instance) =>
    <String, dynamic>{
      'updated': InfoUpdate.dateTimeToJson(instance.date),
      'needUpdate': instance.needUpdate,
    };
