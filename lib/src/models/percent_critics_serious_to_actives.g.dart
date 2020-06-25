// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percent_critics_serious_to_actives.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PercentCriticsSeriousToActives _$PercentCriticsSeriousToActivesFromJson(
    Map<String, dynamic> json) {
  return PercentCriticsSeriousToActives()
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>)
    ..percents = json['percents'] == null
        ? null
        : ItemDoubleList.fromJson(json['percents'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PercentCriticsSeriousToActivesToJson(
        PercentCriticsSeriousToActives instance) =>
    <String, dynamic>{
      'date': instance.date,
      'percents': instance.percents,
    };
