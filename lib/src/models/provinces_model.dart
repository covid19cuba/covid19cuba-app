import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'provinces_model.g.dart';

@JsonSerializable()
class ProvincesModel {
  ProvinceModel all;
  Map<String, MunicipalitiesModel> municipalities;

  ProvincesModel();

  factory ProvincesModel.fromJson(Map<String, dynamic> json) =>
      _$ProvincesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProvincesModelToJson(this);
}
