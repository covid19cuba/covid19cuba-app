// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'team_member.g.dart';

@JsonSerializable()
class TeamMember {
  String name;
  String description;

  factory TeamMember.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberFromJson(json);

  Map<String, dynamic> toJson() => _$TeamMemberToJson(this);

  String link;
  TeamMember();
}