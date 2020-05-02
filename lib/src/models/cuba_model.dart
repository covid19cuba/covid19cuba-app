import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/functions.dart';

part 'cuba_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class CubaModel {
  @JsonKey(name: 'resume')
  List<Item> resume;

  @JsonKey(name: 'cases_by_sex')
  CasesBySex casesBySex;

  @JsonKey(name: 'cases_by_mode_of_contagion')
  CasesByModeOfContagion casesByModeOfContagion;

  @JsonKey(name: 'evolution_of_cases_by_days')
  EvolutionOfCasesByDays evolutionOfCasesByDays;

  @JsonKey(name: 'evolution_of_deaths_by_days')
  EvolutionOfDeathsByDays evolutionOfDeathsByDays;

  @JsonKey(name: 'evolution_of_recovered_by_days')
  EvolutionOfRecoveredByDays evolutionOfRecoveredByDays;

  @JsonKey(name: 'distribution_by_age_ranges')
  List<ItemCode> distributionByAgeRanges;

  @JsonKey(name: 'distribution_of_cases')
  DistributionOfCases distributionOfCases;

  @JsonKey(name: 'cases_by_nationality')
  CasesByNationality casesByNationality;

  @JsonKey(name: 'distribution_by_nationality_of_foreign_cases')
  List<ItemCode> distributionByNationalityOfForeignCases;

  @JsonKey(name: 'list_of_tests_performed')
  ListOfTestsPerformed listOfTestsPerformed;

  @JsonKey(name: 'tests_by_days')
  TestsByDays testsByDays;

  @JsonKey(name: 'tests_positive_percent')
  TestsPositivePercent testsPositivePercent;

  @JsonKey(name: 'affected_provinces')
  List<ItemProvince> affectedProvinces;

  @JsonKey(name: 'affected_municipalities')
  List<ItemMunicipality> affectedMunicipalities;

  @JsonKey(name: 'comparison_of_accumulated_cases')
  ComparisonOfAccumulatedCases comparisonOfAccumulatedCases;

  @JsonKey(name: 'stringency_index_cuba')
  StringencyIndexCubaModel stringencyIndexCuba;

  @JsonKey(name: 'map_data')
  Map<String, dynamic> mapData;

  @JsonKey(name: 'eventos')
  Map<String, dynamic> events;

  @JsonKey(name: 'pesquisador')
  PesquisadorModel pesquisador;

  @JsonKey(name: 'curves_evolution_v2')
  Map<String, dynamic> curvesEvolution;

  @JsonKey(name: 'updated', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime updated;

  @JsonKey(name: 'note')
  String note;

  @JsonKey(name: 'top_20_accumulated_countries')
  List<ItemExtended> top20AccumulatedCountries;

  @JsonKey(name: 'effective_reproductive_number')
  EffectiveReproductiveNumber effectiveReproductiveNumber;

  CubaModel();

  factory CubaModel.fromJson(Map<String, dynamic> json) =>
      _$CubaModelFromJson(json);

  Map<String, dynamic> toJson() => _$CubaModelToJson(this);
}
