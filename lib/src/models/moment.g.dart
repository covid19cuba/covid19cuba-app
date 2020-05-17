// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentModel _$MomentModelFromJson(Map<String, dynamic> json) {
  return MomentModel()
    ..date = dateTimeFromJson(json['date'] as String)
    ..value = json['value'] as String;
}

Map<String, dynamic> _$MomentModelToJson(MomentModel instance) =>
    <String, dynamic>{
      'date': dateTimeToJson(instance.date),
      'value': instance.value,
    };
