// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tips _$TipsFromJson(Map<String, dynamic> json) {
  return Tips()
    ..tips = (json['tips'] as List)
        ?.map((e) =>
            e == null ? null : TipsItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TipsToJson(Tips instance) => <String, dynamic>{
      'tips': instance.tips,
    };
