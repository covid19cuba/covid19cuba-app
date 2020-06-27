// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact()
    ..name = json['name'] as String
    ..date = dateTimeFromJson(json['date'] as String)
    ..place = json['place'] as String;
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'date': dateTimeToJson(instance.date),
      'place': instance.place,
    };
