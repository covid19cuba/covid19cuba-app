// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return StateModel()
    ..version = json['version'] as int
    ..cache = json['cache'] as String
    ..days = json['days'] as int;
}

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'version': instance.version,
      'cache': instance.cache,
      'days': instance.days,
    };
