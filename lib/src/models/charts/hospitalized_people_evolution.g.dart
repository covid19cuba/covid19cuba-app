// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospitalized_people_evolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalizedPeopleEvolution _$HospitalizedPeopleEvolutionFromJson(
    Map<String, dynamic> json) {
  return HospitalizedPeopleEvolution()
    ..unconfirmed = json['unconfirmed'] == null
        ? null
        : ItemList.fromJson(json['unconfirmed'] as Map<String, dynamic>)
    ..confirmed = json['confirmed'] == null
        ? null
        : ItemList.fromJson(json['confirmed'] as Map<String, dynamic>)
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>);
}

Map<String, dynamic> _$HospitalizedPeopleEvolutionToJson(
        HospitalizedPeopleEvolution instance) =>
    <String, dynamic>{
      'unconfirmed': instance.unconfirmed,
      'confirmed': instance.confirmed,
      'date': instance.date,
    };
