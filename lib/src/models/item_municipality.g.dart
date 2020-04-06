// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_municipality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMunicipality _$ItemMunicipalityFromJson(Map<String, dynamic> json) {
  return ItemMunicipality()
    ..value = json['value'] as int
    ..name = json['name'] as String
    ..total = json['total'] as int
    ..province = json['province'] as String;
}

Map<String, dynamic> _$ItemMunicipalityToJson(ItemMunicipality instance) =>
    <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'total': instance.total,
      'province': instance.province,
    };
