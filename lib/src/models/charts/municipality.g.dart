// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Municipality _$MunicipalityFromJson(Map<String, dynamic> json) {
  return Municipality()
    ..municipalityCode = json['dpa_municipality_code'] as String
    ..updated = dateTimeFromJson(json['updated'] as String)
    ..resume = (json['resume'] as List)
        ?.map((e) =>
            e == null ? null : ItemDouble.fromJson(e as Map<String, dynamic>))
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
    ..distributionByAgeRanges = (json['distribution_by_age_ranges'] as List)
        ?.map((e) =>
            e == null ? null : ItemCodePlus.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..casesByNationality = json['cases_by_nationality'] == null
        ? null
        : CasesByNationality.fromJson(
            json['cases_by_nationality'] as Map<String, dynamic>)
    ..distributionByNationalityOfForeignCases =
        (json['distribution_by_nationality_of_foreign_cases'] as List)
            ?.map((e) =>
                e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))
            ?.toList()
    ..deceasesUpdated = dateTimeFromJson(json['deceases_updated'] as String)
    ..deceasesResume = (json['deceases_resume'] as List)
        ?.map((e) =>
            e == null ? null : ItemDouble.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..deceasesEvolutionByDays = json['deceases_evolution_by_days'] == null
        ? null
        : EvolutionOfDeathsByDays.fromJson(json['deceases_evolution_by_days'] as Map<String, dynamic>)
    ..deceasesBySex = json['deceases_by_sex'] == null ? null : CasesBySex.fromJson(json['deceases_by_sex'] as Map<String, dynamic>)
    ..deceasesDistributionByAgeRanges = (json['deceases_distribution_by_age_ranges'] as List)?.map((e) => e == null ? null : ItemCodePlus.fromJson(e as Map<String, dynamic>))?.toList()
    ..deceasesByNationality = json['deceases_by_nationality'] == null ? null : CasesByNationality.fromJson(json['deceases_by_nationality'] as Map<String, dynamic>)
    ..deceasesDistributionAmountDiseaseHistory = (json['deceases_distribution_amount_disease_history'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Item.fromJson(e as Map<String, dynamic>)),
    )
    ..deceasesCommonPreviousDiseases = (json['deceases_common_previous_diseases'] as List)?.map((e) => e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))?.toList();
}

Map<String, dynamic> _$MunicipalityToJson(Municipality instance) =>
    <String, dynamic>{
      'dpa_municipality_code': instance.municipalityCode,
      'updated': dateTimeToJson(instance.updated),
      'resume': instance.resume,
      'cases_by_sex': instance.casesBySex,
      'cases_by_mode_of_contagion': instance.casesByModeOfContagion,
      'evolution_of_cases_by_days': instance.evolutionOfCasesByDays,
      'distribution_by_age_ranges': instance.distributionByAgeRanges,
      'cases_by_nationality': instance.casesByNationality,
      'distribution_by_nationality_of_foreign_cases':
          instance.distributionByNationalityOfForeignCases,
      'deceases_updated': dateTimeToJson(instance.deceasesUpdated),
      'deceases_resume': instance.deceasesResume,
      'deceases_evolution_by_days': instance.deceasesEvolutionByDays,
      'deceases_by_sex': instance.deceasesBySex,
      'deceases_distribution_by_age_ranges':
          instance.deceasesDistributionByAgeRanges,
      'deceases_by_nationality': instance.deceasesByNationality,
      'deceases_distribution_amount_disease_history':
          instance.deceasesDistributionAmountDiseaseHistory,
      'deceases_common_previous_diseases':
          instance.deceasesCommonPreviousDiseases,
    };
