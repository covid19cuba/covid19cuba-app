// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiagnosedModel _$DiagnosedModelFromJson(Map<String, dynamic> json) {
  return DiagnosedModel(
    id: json['id'] as String,
    country: json['pais'] as String,
    age: getInt(json['edad']),
    sex: json['sexo'] as String,
    arrivalInCubaFocus: dateTimeFromJson(json['arribo_a_cuba_foco'] as String),
    medicalConsultation: dateTimeFromJson(json['consulta_medico'] as String),
    detectionMunicipality: json['municipio_detección'] as String,
    detectionProvince: json['provincia_detección'] as String,
    dpacodeMunicipalityDetection: json['dpacode_municipio_deteccion'] as String,
    dpacodeProvinceDetection: json['dpacode_provincia_deteccion'] as String,
    visitedProvinces: (json['provincias_visitadas'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    dpacodeVisitedProvinces: (json['dpacode_provincias_visitadas'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    contagion: json['contagio'] as String,
    focalContact: getInt(json['contacto_focal']),
    isolationCenter: json['centro_aislamiento'] as String,
    diagnosticCenter: json['centro_diagnostico'] as String,
    possibleOriginContagion: (json['posible_procedencia_contagio'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$DiagnosedModelToJson(DiagnosedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pais': instance.country,
      'edad': instance.age,
      'sexo': instance.sex,
      'arribo_a_cuba_foco': dateTimeToJson(instance.arrivalInCubaFocus),
      'consulta_medico': dateTimeToJson(instance.medicalConsultation),
      'municipio_detección': instance.detectionMunicipality,
      'provincia_detección': instance.detectionProvince,
      'dpacode_municipio_deteccion': instance.dpacodeMunicipalityDetection,
      'dpacode_provincia_deteccion': instance.dpacodeProvinceDetection,
      'provincias_visitadas': instance.visitedProvinces,
      'dpacode_provincias_visitadas': instance.dpacodeVisitedProvinces,
      'contagio': instance.contagion,
      'contacto_focal': instance.focalContact,
      'centro_aislamiento': instance.isolationCenter,
      'centro_diagnostico': instance.diagnosticCenter,
      'posible_procedencia_contagio': instance.possibleOriginContagion,
    };
