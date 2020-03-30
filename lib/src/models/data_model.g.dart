// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return DataModel(
    cases: json['casos'] == null
        ? null
        : CasesModel.fromJson(json['casos'] as Map<String, dynamic>),
    diagnosticCenters:
        (json['centros_diagnostico'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : CenterModel.fromJson(e as Map<String, dynamic>)),
    ),
    isolationCenters:
        (json['centros_aislamiento'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : CenterModel.fromJson(e as Map<String, dynamic>)),
    ),
    note: json['note-text'] as String,
  );
}

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'casos': instance.cases,
      'centros_diagnostico': instance.diagnosticCenters,
      'centros_aislamiento': instance.isolationCenters,
      'note-text': instance.note,
    };
