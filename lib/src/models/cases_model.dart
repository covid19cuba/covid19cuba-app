import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'cases_model.g.dart';

@JsonSerializable()
class CasesModel {
  @JsonKey(name: 'dias')
  Map<String, DayModel> days;

  CasesModel({this.days});

  factory CasesModel.fromJson(Map<String, dynamic> json) =>
      _$CasesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CasesModelToJson(this);
}
