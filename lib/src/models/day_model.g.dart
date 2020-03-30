// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayModel _$DayModelFromJson(Map<String, dynamic> json) {
  return DayModel(
    date: dateTimeFromJson(json['fecha'] as String),
    diagnosed: (json['diagnosticados'] as List)
        ?.map((e) => e == null
            ? null
            : DiagnosedModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    riskSubjects: getInt(json['sujetos_riesgo']),
    seriousNumber: getInt(json['graves_numero']),
    seriousId: (json['graves_id'] as List)?.map((e) => e as String)?.toList(),
    deathsNumber: getInt(json['muertes_numero']),
    deathsId: (json['muertes_id'] as List)?.map((e) => e as String)?.toList(),
    evacueesNumber: getInt(json['evacuados_numero']),
    evacueesId:
        (json['evacuados_id'] as List)?.map((e) => e as String)?.toList(),
    recoveredNumber: getInt(json['recuperados_numero']),
    recoveredId:
        (json['recuperados_id'] as List)?.map((e) => e as String)?.toList(),
  )..testsTotal = getInt(json['tests_total']);
}

Map<String, dynamic> _$DayModelToJson(DayModel instance) => <String, dynamic>{
      'fecha': dateTimeToJson(instance.date),
      'diagnosticados': instance.diagnosed,
      'sujetos_riesgo': instance.riskSubjects,
      'tests_total': instance.testsTotal,
      'graves_numero': instance.seriousNumber,
      'graves_id': instance.seriousId,
      'muertes_numero': instance.deathsNumber,
      'muertes_id': instance.deathsId,
      'evacuados_numero': instance.evacueesNumber,
      'evacuados_id': instance.evacueesId,
      'recuperados_numero': instance.recoveredNumber,
      'recuperados_id': instance.recoveredId,
    };
