import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

part 'day_model.g.dart';

@JsonSerializable()
class DayModel {
  @JsonKey(
    name: 'fecha',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  DateTime date;

  @JsonKey(name: 'diagnosticados')
  List<DiagnosedModel> diagnosed;

  @JsonKey(name: 'sujetos_riesgo', fromJson: getInt)
  int riskSubjects;

  @JsonKey(name: 'graves_numero', fromJson: getInt)
  int seriousNumber;

  @JsonKey(name: 'graves_id')
  List<String> seriousId;

  @JsonKey(name: 'muertes_numero', fromJson: getInt)
  int deathsNumber;

  @JsonKey(name: 'muertes_id')
  List<String> deathsId;

  @JsonKey(name: 'evacuados_numero', fromJson: getInt)
  int evacueesNumber;

  @JsonKey(name: 'evacuados_id')
  List<String> evacueesId;

  @JsonKey(name: 'recuperados_numero', fromJson: getInt)
  int recoveredNumber;

  @JsonKey(name: 'recuperados_id')
  List<String> recoveredId;

  DayModel({
    this.date,
    this.diagnosed,
    this.riskSubjects,
    this.seriousNumber,
    this.seriousId,
    this.deathsNumber,
    this.deathsId,
    this.evacueesNumber,
    this.evacueesId,
    this.recoveredNumber,
    this.recoveredId,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) =>
      _$DayModelFromJson(json);

  Map<String, dynamic> toJson() => _$DayModelToJson(this);
}
