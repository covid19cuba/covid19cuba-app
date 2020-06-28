// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moment _$MomentFromJson(Map<String, dynamic> json) {
  return Moment()
    ..date = dateTimeFromJson(json['date'] as String)
    ..value = json['value'] as String;
}

Map<String, dynamic> _$MomentToJson(Moment instance) => <String, dynamic>{
      'date': dateTimeToJson(instance.date),
      'value': instance.value,
    };
