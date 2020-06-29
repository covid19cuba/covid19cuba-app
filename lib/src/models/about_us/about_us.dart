// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/about_us/collaborator.dart';
import 'package:covid19cuba/src/models/about_us/promoter.dart';
import 'package:covid19cuba/src/models/about_us/replica.dart';
import 'package:covid19cuba/src/models/about_us/team_member.dart';
import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'about_us.g.dart';

@JsonSerializable()
class AboutUs  extends Model{
  List<Collaborator> collaborators;
  List<Promoter> promoters;
  List<Replica> replicas;
  @JsonKey(name: 'team_members')
  List<TeamMember> teamMembers;
  String thanks;

  AboutUs();

  factory AboutUs.fromJson(Map<String, dynamic> json) =>
      _$AboutUsFromJson(json);

  Map<String, dynamic> toJson() => _$AboutUsToJson(this);
}
