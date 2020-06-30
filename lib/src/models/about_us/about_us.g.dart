// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUs _$AboutUsFromJson(Map<String, dynamic> json) {
  return AboutUs()
    ..collaborators = (json['collaborators'] as List)
        ?.map((e) =>
            e == null ? null : Collaborator.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..promoters = (json['promoters'] as List)
        ?.map((e) =>
            e == null ? null : Promoter.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..replicas = (json['replicas'] as List)
        ?.map((e) =>
            e == null ? null : Replica.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..teamMembers = (json['team_members'] as List)
        ?.map((e) =>
            e == null ? null : TeamMember.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..thanks = json['thanks'] as String;
}

Map<String, dynamic> _$AboutUsToJson(AboutUs instance) => <String, dynamic>{
      'collaborators': instance.collaborators,
      'promoters': instance.promoters,
      'replicas': instance.replicas,
      'team_members': instance.teamMembers,
      'thanks': instance.thanks,
    };
