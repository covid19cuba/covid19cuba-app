// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_under_surveillance_evolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleUnderSurveillanceEvolution _$PeopleUnderSurveillanceEvolutionFromJson(
    Map<String, dynamic> json) {
  return PeopleUnderSurveillanceEvolution()
    ..hospitalized = json['hospitalized'] == null
        ? null
        : ItemList.fromJson(json['hospitalized'] as Map<String, dynamic>)
    ..homeSurveillance = json['home_surveillance'] == null
        ? null
        : ItemList.fromJson(json['home_surveillance'] as Map<String, dynamic>)
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PeopleUnderSurveillanceEvolutionToJson(
        PeopleUnderSurveillanceEvolution instance) =>
    <String, dynamic>{
      'hospitalized': instance.hospitalized,
      'home_surveillance': instance.homeSurveillance,
      'date': instance.date,
    };
