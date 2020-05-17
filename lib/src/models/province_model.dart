// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/functions.dart';

part 'province_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class ProvinceModel {
  @JsonKey(name: 'resume')
  List<Item> resume;

  @JsonKey(name: 'cases_by_sex')
  CasesBySex casesBySex;

  @JsonKey(name: 'cases_by_mode_of_contagion')
  CasesByModeOfContagion casesByModeOfContagion;

  @JsonKey(name: 'evolution_of_cases_by_days')
  EvolutionOfCasesByDays evolutionOfCasesByDays;

  @JsonKey(name: 'distribution_by_age_ranges')
  List<ItemCodePlus> distributionByAgeRanges;

  @JsonKey(name: 'cases_by_nationality')
  CasesByNationality casesByNationality;

  @JsonKey(name: 'distribution_by_nationality_of_foreign_cases')
  List<ItemCode> distributionByNationalityOfForeignCases;

  @JsonKey(name: 'affected_municipalities')
  List<ItemMunicipality> affectedMunicipalities;

  @JsonKey(name: 'updated', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime updated;

  @JsonKey(name: 'dpa_province_code')
  String provinceCode;

  @JsonKey(name: 'map_data')
  Map<String, dynamic> mapData;

  @JsonKey(name: 'effective_reproductive_number')
  EffectiveReproductiveNumber effectiveReproductiveNumber;

  ProvinceModel();

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);
}
