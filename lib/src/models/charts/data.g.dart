// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data()
    ..all = json['all'] == null
        ? null
        : National.fromJson(json['all'] as Map<String, dynamic>)
    ..provinces = (json['provinces'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Provinces.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'all': instance.all,
      'provinces': instance.provinces,
    };
