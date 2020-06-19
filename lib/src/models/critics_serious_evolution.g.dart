// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'critics_serious_evolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CriticsSeriousEvolution _$CriticsSeriousEvolutionFromJson(
    Map<String, dynamic> json) {
  return CriticsSeriousEvolution()
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>)
    ..critics = json['critics'] == null
        ? null
        : ItemList.fromJson(json['critics'] as Map<String, dynamic>)
    ..serious = json['serious'] == null
        ? null
        : ItemList.fromJson(json['serious'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CriticsSeriousEvolutionToJson(
        CriticsSeriousEvolution instance) =>
    <String, dynamic>{
      'date': instance.date,
      'critics': instance.critics,
      'serious': instance.serious,
    };
