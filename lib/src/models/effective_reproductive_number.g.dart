// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effective_reproductive_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EffectiveReproductiveNumber _$EffectiveReproductiveNumberFromJson(
    Map<String, dynamic> json) {
  return EffectiveReproductiveNumber()
    ..upper = json['upper'] == null
        ? null
        : ItemDoubleList.fromJson(json['upper'] as Map<String, dynamic>)
    ..value = json['value'] == null
        ? null
        : ItemDoubleList.fromJson(json['value'] as Map<String, dynamic>)
    ..lower = json['lower'] == null
        ? null
        : ItemDoubleList.fromJson(json['lower'] as Map<String, dynamic>)
    ..date = json['date'] == null
        ? null
        : ItemDateList.fromJson(json['date'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EffectiveReproductiveNumberToJson(
        EffectiveReproductiveNumber instance) =>
    <String, dynamic>{
      'upper': instance.upper,
      'value': instance.value,
      'lower': instance.lower,
      'date': instance.date,
    };
