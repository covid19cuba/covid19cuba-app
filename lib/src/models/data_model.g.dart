// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return DataModel()
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
    ..evolutionOfDeathsByDays = json['evolution_of_deaths_by_days'] == null
        ? null
        : EvolutionOfDeathsByDays.fromJson(
            json['evolution_of_deaths_by_days'] as Map<String, dynamic>)
    ..evolutionOfRecoveredByDays =
        json['evolution_of_recovered_by_days'] == null
            ? null
            : EvolutionOfRecoveredByDays.fromJson(
                json['evolution_of_recovered_by_days'] as Map<String, dynamic>)
    ..distributionByAgeRanges = (json['distribution_by_age_ranges'] as List)
        ?.map((e) =>
            e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..casesByNationality = json['cases_by_nationality'] == null
        ? null
        : CasesByNationality.fromJson(
            json['cases_by_nationality'] as Map<String, dynamic>)
    ..distributionByNationalityOfForeignCases =
        (json['distribution_by_nationality_of_foreign_cases'] as List)?.map((e) => e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))?.toList()
    ..listOfTestsPerformed = json['list_of_tests_performed'] == null ? null : ListOfTestsPerformed.fromJson(json['list_of_tests_performed'] as Map<String, dynamic>)
    ..testsByDays = json['tests_by_days'] == null ? null : TestsByDays.fromJson(json['tests_by_days'] as Map<String, dynamic>)
    ..affectedProvinces = (json['affected_provinces'] as List)?.map((e) => e == null ? null : ItemProvince.fromJson(e as Map<String, dynamic>))?.toList()
    ..affectedMunicipalities = (json['affected_municipalities'] as List)?.map((e) => e == null ? null : ItemMunicipality.fromJson(e as Map<String, dynamic>))?.toList()
    ..comparisonOfAccumulatedCases = json['comparison_of_accumulated_cases'] == null ? null : ComparisonOfAccumulatedCases.fromJson(json['comparison_of_accumulated_cases'] as Map<String, dynamic>)
    ..mapData = json['map_data'] as Map<String, dynamic>
    ..curvesEvolution = json['curves_evolution'] as Map<String, dynamic>
    ..events = json['eventos'] as Map<String, dynamic>
    ..updated = dateTimeFromJson(json['updated'] as String)
    ..note = json['note'] as String
    ..top20AccumulatedCountries = (json['top_20_accumulated_countries'] as List)?.map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))?.toList();
}

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'resume': instance.resume,
      'cases_by_sex': instance.casesBySex,
      'cases_by_mode_of_contagion': instance.casesByModeOfContagion,
      'evolution_of_cases_by_days': instance.evolutionOfCasesByDays,
      'evolution_of_deaths_by_days': instance.evolutionOfDeathsByDays,
      'evolution_of_recovered_by_days': instance.evolutionOfRecoveredByDays,
      'distribution_by_age_ranges': instance.distributionByAgeRanges,
      'cases_by_nationality': instance.casesByNationality,
      'distribution_by_nationality_of_foreign_cases':
          instance.distributionByNationalityOfForeignCases,
      'list_of_tests_performed': instance.listOfTestsPerformed,
      'tests_by_days': instance.testsByDays,
      'affected_provinces': instance.affectedProvinces,
      'affected_municipalities': instance.affectedMunicipalities,
      'comparison_of_accumulated_cases': instance.comparisonOfAccumulatedCases,
      'map_data': instance.mapData,
      'curves_evolution': instance.curvesEvolution,
      'updated': dateTimeToJson(instance.updated),
      'note': instance.note,
      'top_20_accumulated_countries': instance.top20AccumulatedCountries,
      'eventos': instance.events
    };
