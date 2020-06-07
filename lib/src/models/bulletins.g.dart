// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bulletins _$BulletinsFromJson(Map<String, dynamic> json) {
  return Bulletins()
    ..providers = (json['providers'] as List)
        ?.map((e) => e == null
            ? null
            : BulletinProvider.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BulletinsToJson(Bulletins instance) => <String, dynamic>{
      'providers': instance.providers,
    };
