import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'cases_by_sex.g.dart';

@JsonSerializable()
class CasesBySex {
  Item men;
  Item women;
  Item unknown;

  CasesBySex();

  factory CasesBySex.fromJson(Map<String, dynamic> json) =>
      _$CasesBySexFromJson(json);

  Map<String, dynamic> toJson() => _$CasesBySexToJson(this);
}
