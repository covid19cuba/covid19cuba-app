// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'municipality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MunicipalityModel _$MunicipalityModelFromJson(Map<String, dynamic> json) {
  return MunicipalityModel()
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
    ..distributionByAgeRanges = (json['distribution_by_age_ranges'] as List)
        ?.map((e) =>
            e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))
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
    ..updated = dateTimeFromJson(json['updated'] as String)
    ..municipalityCode = json['dpa_municipality_code'] as String
    ..mapData = json['map_data'] as Map<String, dynamic>;
}

Map<String, dynamic> _$MunicipalityModelToJson(MunicipalityModel instance) =>
    <String, dynamic>{
      'resume': instance.resume,
      'cases_by_sex': instance.casesBySex,
      'cases_by_mode_of_contagion': instance.casesByModeOfContagion,
      'evolution_of_cases_by_days': instance.evolutionOfCasesByDays,
      'distribution_by_age_ranges': instance.distributionByAgeRanges,
      'cases_by_nationality': instance.casesByNationality,
      'distribution_by_nationality_of_foreign_cases':
          instance.distributionByNationalityOfForeignCases,
      'updated': dateTimeToJson(instance.updated),
      'dpa_municipality_code': instance.municipalityCode,
      'map_data': instance.mapData,
    };
