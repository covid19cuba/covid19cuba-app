// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provinces _$ProvincesFromJson(Map<String, dynamic> json) {
  return Provinces()
    ..all = json['all'] == null
        ? null
        : Province.fromJson(json['all'] as Map<String, dynamic>)
    ..municipalities = (json['municipalities'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : Municipalities.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$ProvincesToJson(Provinces instance) => <String, dynamic>{
      'all': instance.all,
      'municipalities': instance.municipalities,
    };
