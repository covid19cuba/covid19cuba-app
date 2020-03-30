import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/utils/utils.dart';

part 'diagnosed_model.g.dart';

@JsonSerializable()
class DiagnosedModel {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'pais')
  String country;

  @JsonKey(name: 'edad', fromJson: getInt)
  int age;

  @JsonKey(name: 'sexo')
  String sex;

  @JsonKey(
    name: 'arribo_a_cuba_foco',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  DateTime arrivalInCubaFocus;

  @JsonKey(
    name: 'consulta_medico',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  DateTime medicalConsultation;

  @JsonKey(name: 'municipio_detección')
  String detectionMunicipality;

  @JsonKey(name: 'provincia_detección')
  String detectionProvince;

  @JsonKey(name: 'dpacode_municipio_deteccion')
  String dpacodeMunicipalityDetection;

  @JsonKey(name: 'dpacode_provincia_deteccion')
  String dpacodeProvinceDetection;

  @JsonKey(name: 'provincias_visitadas')
  List<String> visitedProvinces;

  @JsonKey(name: 'dpacode_provincias_visitadas')
  List<String> dpacodeVisitedProvinces;

  @JsonKey(name: 'contagio')
  String contagion;

  @JsonKey(name: 'contacto_focal', fromJson: getInt)
  int focalContact;

  @JsonKey(name: 'centro_aislamiento')
  String isolationCenter;

  @JsonKey(name: 'centro_diagnostico')
  String diagnosticCenter;

  @JsonKey(name: 'posible_procedencia_contagio')
  List<String> possibleOriginContagion;

  DiagnosedModel({
    this.id,
    this.country,
    this.age,
    this.sex,
    this.arrivalInCubaFocus,
    this.medicalConsultation,
    this.detectionMunicipality,
    this.detectionProvince,
    this.dpacodeMunicipalityDetection,
    this.dpacodeProvinceDetection,
    this.visitedProvinces,
    this.dpacodeVisitedProvinces,
    this.contagion,
    this.focalContact,
    this.isolationCenter,
    this.diagnosticCenter,
    this.possibleOriginContagion,
  });

  factory DiagnosedModel.fromJson(Map<String, dynamic> json) =>
      _$DiagnosedModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiagnosedModelToJson(this);
}
