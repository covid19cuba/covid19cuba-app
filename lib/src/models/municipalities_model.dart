import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'municipalities_model.g.dart';

@JsonSerializable()
class MunicipalitiesModel {
  MunicipalityModel all;

  MunicipalitiesModel();

  factory MunicipalitiesModel.fromJson(Map<String, dynamic> json) =>
      _$MunicipalitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MunicipalitiesModelToJson(this);
}
