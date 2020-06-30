// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return Province()
    ..provinceCode = json['dpa_province_code'] as String
    ..updated = dateTimeFromJson(json['updated'] as String)
    ..resume = (json['resume'] as List)
        ?.map((e) =>
            e == null ? null : ItemDouble.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..mapData = json['map_data'] as Map<String, dynamic>
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
    ..effectiveReproductiveNumber =
        json['effective_reproductive_number'] == null
            ? null
            : EffectiveReproductiveNumber.fromJson(
                json['effective_reproductive_number'] as Map<String, dynamic>)
    ..affectedMunicipalities = (json['affected_municipalities'] as List)
        ?.map((e) => e == null ? null : ItemMunicipality.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..deceasesUpdated = dateTimeFromJson(json['deceases_updated'] as String)
    ..deceasesResume = (json['deceases_resume'] as List)?.map((e) => e == null ? null : ItemDouble.fromJson(e as Map<String, dynamic>))?.toList()
    ..deceasesMapData = json['deceases_map_data'] as Map<String, dynamic>
    ..deceasesEvolutionByDays = json['deceases_evolution_by_days'] == null ? null : EvolutionOfDeathsByDays.fromJson(json['deceases_evolution_by_days'] as Map<String, dynamic>)
    ..deceasesBySex = json['deceases_by_sex'] == null ? null : CasesBySex.fromJson(json['deceases_by_sex'] as Map<String, dynamic>)
    ..deceasesDistributionByAgeRanges = (json['deceases_distribution_by_age_ranges'] as List)?.map((e) => e == null ? null : ItemCodePlus.fromJson(e as Map<String, dynamic>))?.toList()
    ..deceasesByNationality = json['deceases_by_nationality'] == null ? null : CasesByNationality.fromJson(json['deceases_by_nationality'] as Map<String, dynamic>)
    ..deceasesDistributionAmountDiseaseHistory = (json['deceases_distribution_amount_disease_history'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Item.fromJson(e as Map<String, dynamic>)),
    )
    ..deceasesCommonPreviousDiseases = (json['deceases_common_previous_diseases'] as List)?.map((e) => e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))?.toList()
    ..deceasesAffectedMunicipalities = (json['deceases_affected_municipalities'] as List)?.map((e) => e == null ? null : ItemMunicipality.fromJson(e as Map<String, dynamic>))?.toList();
}

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'dpa_province_code': instance.provinceCode,
      'updated': dateTimeToJson(instance.updated),
      'resume': instance.resume,
      'map_data': instance.mapData,
      'cases_by_sex': instance.casesBySex,
      'cases_by_mode_of_contagion': instance.casesByModeOfContagion,
      'evolution_of_cases_by_days': instance.evolutionOfCasesByDays,
      'distribution_by_age_ranges': instance.distributionByAgeRanges,
      'cases_by_nationality': instance.casesByNationality,
      'distribution_by_nationality_of_foreign_cases':
          instance.distributionByNationalityOfForeignCases,
      'effective_reproductive_number': instance.effectiveReproductiveNumber,
      'affected_municipalities': instance.affectedMunicipalities,
      'deceases_updated': dateTimeToJson(instance.deceasesUpdated),
      'deceases_resume': instance.deceasesResume,
      'deceases_map_data': instance.deceasesMapData,
      'deceases_evolution_by_days': instance.deceasesEvolutionByDays,
      'deceases_by_sex': instance.deceasesBySex,
      'deceases_distribution_by_age_ranges':
          instance.deceasesDistributionByAgeRanges,
      'deceases_by_nationality': instance.deceasesByNationality,
      'deceases_distribution_amount_disease_history':
          instance.deceasesDistributionAmountDiseaseHistory,
      'deceases_common_previous_diseases':
          instance.deceasesCommonPreviousDiseases,
      'deceases_affected_municipalities':
          instance.deceasesAffectedMunicipalities,
    };
