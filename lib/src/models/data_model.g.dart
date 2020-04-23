// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return DataModel()
    ..all = json['all'] == null
        ? null
        : CubaModel.fromJson(json['all'] as Map<String, dynamic>)
    ..provinces = (json['provinces'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ProvincesModel.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'all': instance.all,
      'provinces': instance.provinces,
    };
