// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/functions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cuba_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class CubaModel {
  @JsonKey(name: 'updated', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime updated;

  @JsonKey(name: 'resume')
  List<Item> resume;

  @JsonKey(name: 'note')
  String note;

  @JsonKey(name: 'map_data')
  Map<String, dynamic> mapData;

  @JsonKey(name: 'events')
  Map<String, dynamic> events;

  @JsonKey(name: 'cases_by_sex')
  CasesBySex casesBySex;

  @JsonKey(name: 'cases_by_mode_of_contagion')
  CasesByModeOfContagion casesByModeOfContagion;

  @JsonKey(name: 'evolution_of_cases_by_days')
  EvolutionOfCasesByDays evolutionOfCasesByDays;

  @JsonKey(name: 'evolution_of_recovered_by_days')
  EvolutionOfRecoveredByDays evolutionOfRecoveredByDays;

  @JsonKey(name: 'evolution_of_deaths_by_days')
  EvolutionOfDeathsByDays evolutionOfDeathsByDays;

  @JsonKey(name: 'distribution_of_cases')
  DistributionOfCases distributionOfCases;

  @JsonKey(name: 'evolution_of_cases_and_recovered_by_days')
  EvolutionOfCasesAndRecoveredByDays evolutionOfCasesAndRecoveredByDays;

  @JsonKey(name: 'evolution_of_active_and_recovered_accumulated')
  EvolutionOfActiveAndRecoveredAccumulated
      evolutionOfActiveAndRecoveredAccumulated;

  @JsonKey(name: 'distribution_by_age_ranges')
  List<ItemCodePlus> distributionByAgeRanges;

  @JsonKey(name: 'cases_by_nationality')
  CasesByNationality casesByNationality;

  @JsonKey(name: 'distribution_by_nationality_of_foreign_cases')
  List<ItemCode> distributionByNationalityOfForeignCases;

  @JsonKey(name: 'relation_of_tests_performed')
  RelationOfTestsPerformed relationOfTestsPerformed;

  @JsonKey(name: 'tests_by_days')
  TestsByDays testsByDays;

  @JsonKey(name: 'percent_positive_tests')
  PercentPositiveTests percentPositiveTests;

  @JsonKey(name: 'critics_serious_evolution')
  CriticsSeriousEvolution criticsSeriousEvolution;

  @JsonKey(name: 'percent_critics_serious_to_actives')
  PercentCriticsSeriousToActives percentCriticsSeriousToActives;

  @JsonKey(name: 'effective_reproductive_number')
  EffectiveReproductiveNumber effectiveReproductiveNumber;

  @JsonKey(name: 'stringency_index_cuba')
  StringencyIndexCubaModel stringencyIndexCuba;

  @JsonKey(name: 'affected_provinces')
  List<ItemProvince> affectedProvinces;

  @JsonKey(name: 'affected_municipalities')
  List<ItemMunicipality> affectedMunicipalities;

  @JsonKey(name: 'multiple_comparison_of_cuba_with_radar')
  MultipleComparisonOfCubaWithRadarModel multipleComparisonOfCubaWithRadar;

  @JsonKey(name: 'curves_comparison')
  CurvesComparisonModel curvesComparison;

  @JsonKey(name: 'test_behavior_comparison')
  Map<String, TestBehaviorComparison> testBehaviorComparison;

  @JsonKey(name: 'curves_evolution')
  Map<String, dynamic> curvesEvolution;

  @JsonKey(name: 'world_countries')
  List<ItemExtended> worldCountries;

  @JsonKey(name: 'pesquisador')
  PesquisadorModel pesquisador;

  @JsonKey(
    name: 'deceases_updated',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  DateTime deceasesUpdated;

  @JsonKey(name: 'deceases_map_data')
  Map<String, dynamic> deceasesMapData;

  @JsonKey(name: 'deceases_evolution_by_days')
  EvolutionOfDeathsByDays deceasesEvolutionByDays;

  @JsonKey(name: 'deceases_by_sex')
  CasesBySex deceasesBySex;

  @JsonKey(name: 'deceases_distribution_by_age_ranges')
  List<ItemCodePlus> deceasesDistributionByAgeRanges;

  @JsonKey(name: 'deceases_by_nationality')
  CasesByNationality deceasesByNationality;

  @JsonKey(name: 'deceases_distribution_amount_disease_history')
  Map<String, Item> deceasesDistributionAmountDiseaseHistory;

  @JsonKey(name: 'deceases_common_previous_diseases')
  List<Item> deceasesCommonPreviousDiseases;

  @JsonKey(name: 'deceases_affected_provinces')
  List<ItemProvince> deceasesAffectedProvinces;

  @JsonKey(name: 'deceases_affected_municipalities')
  List<ItemMunicipality> deceasesAffectedMunicipalities;

  CubaModel();

  factory CubaModel.fromJson(Map<String, dynamic> json) =>
      _$CubaModelFromJson(json);

  Map<String, dynamic> toJson() => _$CubaModelToJson(this);
}
