// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'cuba_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CubaModel _$CubaModelFromJson(Map<String, dynamic> json) {
  return CubaModel()
    ..resume = (json['resume'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..casesBySex = json['cases_by_sex'] == null
        ? null
        : CasesBySex.fromJson(json['cases_by_sex'] as Map<String, dynamic>)
    ..casesByModeOfContagion = json['cases_by_mode_of_contagion'] == null
        ? null
        : CasesByModeOfContagion.fromJson(
            json['cases_by_mode_of_contagion'] as Map<String, dynamic>)
    ..evolutionOfCasesByDays = json['evolution_of_cases_by_days'] == null
        ? null
        : EvolutionOfCasesByDays.fromJson(
            json['evolution_of_cases_by_days'] as Map<String, dynamic>)
    ..evolutionOfCasesAndRecoveredByDays =
        json['evolution_of_cases_and_recovered_by_days'] == null
            ? null
            : EvolutionOfCasesAndRecoveredByDays.fromJson(
                json['evolution_of_cases_and_recovered_by_days']
                    as Map<String, dynamic>)
    ..evolutionOfActiveAndRecoveredAccumulated =
        json['evolution_of_active_and_recovered_accumulated'] == null
            ? null
            : EvolutionOfActiveAndRecoveredAccumulated.fromJson(
                json['evolution_of_active_and_recovered_accumulated']
                    as Map<String, dynamic>)
    ..evolutionOfDeathsByDays = json['evolution_of_deaths_by_days'] == null
        ? null
        : EvolutionOfDeathsByDays.fromJson(json['evolution_of_deaths_by_days'] as Map<String, dynamic>)
    ..evolutionOfRecoveredByDays = json['evolution_of_recovered_by_days'] == null ? null : EvolutionOfRecoveredByDays.fromJson(json['evolution_of_recovered_by_days'] as Map<String, dynamic>)
    ..distributionByAgeRanges = (json['distribution_by_age_ranges'] as List)?.map((e) => e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))?.toList()
    ..distributionOfCases = json['distribution_of_cases'] == null ? null : DistributionOfCases.fromJson(json['distribution_of_cases'] as Map<String, dynamic>)
    ..casesByNationality = json['cases_by_nationality'] == null ? null : CasesByNationality.fromJson(json['cases_by_nationality'] as Map<String, dynamic>)
    ..distributionByNationalityOfForeignCases = (json['distribution_by_nationality_of_foreign_cases'] as List)?.map((e) => e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))?.toList()
    ..listOfTestsPerformed = json['list_of_tests_performed'] == null ? null : ListOfTestsPerformed.fromJson(json['list_of_tests_performed'] as Map<String, dynamic>)
    ..testsByDays = json['tests_by_days'] == null ? null : TestsByDays.fromJson(json['tests_by_days'] as Map<String, dynamic>)
    ..testsPositivePercent = json['tests_positive_percent'] == null ? null : TestsPositivePercent.fromJson(json['tests_positive_percent'] as Map<String, dynamic>)
    ..affectedProvinces = (json['affected_provinces'] as List)?.map((e) => e == null ? null : ItemProvince.fromJson(e as Map<String, dynamic>))?.toList()
    ..affectedMunicipalities = (json['affected_municipalities'] as List)?.map((e) => e == null ? null : ItemMunicipality.fromJson(e as Map<String, dynamic>))?.toList()
    ..comparisonOfAccumulatedCases = json['comparison_of_accumulated_cases'] == null ? null : ComparisonOfAccumulatedCases.fromJson(json['comparison_of_accumulated_cases'] as Map<String, dynamic>)
    ..stringencyIndexCuba = json['stringency_index_cuba'] == null ? null : StringencyIndexCubaModel.fromJson(json['stringency_index_cuba'] as Map<String, dynamic>)
    ..mapData = json['map_data'] as Map<String, dynamic>
    ..events = json['eventos'] as Map<String, dynamic>
    ..pesquisador = json['pesquisador'] == null ? null : PesquisadorModel.fromJson(json['pesquisador'] as Map<String, dynamic>)
    ..curvesEvolution = json['curves_evolution_v2'] as Map<String, dynamic>
    ..updated = dateTimeFromJson(json['updated'] as String)
    ..note = json['note'] as String
    ..worldCountries = (json['world_countries'] as List)?.map((e) => e == null ? null : ItemExtended.fromJson(e as Map<String, dynamic>))?.toList()
    ..effectiveReproductiveNumber = json['effective_reproductive_number'] == null ? null : EffectiveReproductiveNumber.fromJson(json['effective_reproductive_number'] as Map<String, dynamic>)
    ..testBehaviorComparison = (json['test_behavior_comparison'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TestBehaviorComparison.fromJson(e as Map<String, dynamic>)),
    )
    ..radarChartData = json['radar_chart_data'] == null ? null : RadarModel.fromJson(json['radar_chart_data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CubaModelToJson(CubaModel instance) => <String, dynamic>{
      'resume': instance.resume,
      'cases_by_sex': instance.casesBySex,
      'cases_by_mode_of_contagion': instance.casesByModeOfContagion,
      'evolution_of_cases_by_days': instance.evolutionOfCasesByDays,
      'evolution_of_cases_and_recovered_by_days':
          instance.evolutionOfCasesAndRecoveredByDays,
      'evolution_of_active_and_recovered_accumulated':
          instance.evolutionOfActiveAndRecoveredAccumulated,
      'evolution_of_deaths_by_days': instance.evolutionOfDeathsByDays,
      'evolution_of_recovered_by_days': instance.evolutionOfRecoveredByDays,
      'distribution_by_age_ranges': instance.distributionByAgeRanges,
      'distribution_of_cases': instance.distributionOfCases,
      'cases_by_nationality': instance.casesByNationality,
      'distribution_by_nationality_of_foreign_cases':
          instance.distributionByNationalityOfForeignCases,
      'list_of_tests_performed': instance.listOfTestsPerformed,
      'tests_by_days': instance.testsByDays,
      'tests_positive_percent': instance.testsPositivePercent,
      'affected_provinces': instance.affectedProvinces,
      'affected_municipalities': instance.affectedMunicipalities,
      'comparison_of_accumulated_cases': instance.comparisonOfAccumulatedCases,
      'stringency_index_cuba': instance.stringencyIndexCuba,
      'map_data': instance.mapData,
      'eventos': instance.events,
      'pesquisador': instance.pesquisador,
      'curves_evolution_v2': instance.curvesEvolution,
      'updated': dateTimeToJson(instance.updated),
      'note': instance.note,
      'world_countries': instance.worldCountries,
      'effective_reproductive_number': instance.effectiveReproductiveNumber,
      'test_behavior_comparison': instance.testBehaviorComparison,
      'radar_chart_data': instance.radarChartData,
    };
