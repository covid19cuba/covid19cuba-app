// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return ContactModel()
    ..name = json['name'] as String
    ..date = dateTimeFromJson(json['date'] as String)
    ..place = json['place'] as String;
}

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': dateTimeToJson(instance.date),
      'place': instance.place,
    };
