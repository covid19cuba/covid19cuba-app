// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relation_of_tests_performed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationOfTestsPerformed _$RelationOfTestsPerformedFromJson(
    Map<String, dynamic> json) {
  return RelationOfTestsPerformed()
    ..positive = json['positive'] == null
        ? null
        : Item.fromJson(json['positive'] as Map<String, dynamic>)
    ..negative = json['negative'] == null
        ? null
        : Item.fromJson(json['negative'] as Map<String, dynamic>)
    ..total = json['total'] == null
        ? null
        : Item.fromJson(json['total'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RelationOfTestsPerformedToJson(
        RelationOfTestsPerformed instance) =>
    <String, dynamic>{
      'positive': instance.positive,
      'negative': instance.negative,
      'total': instance.total,
    };
