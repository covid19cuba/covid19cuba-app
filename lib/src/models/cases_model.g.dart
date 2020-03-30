// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasesModel _$CasesModelFromJson(Map<String, dynamic> json) {
  return CasesModel(
    days: (json['dias'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : DayModel.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$CasesModelToJson(CasesModel instance) =>
    <String, dynamic>{
      'dias': instance.days,
    };
