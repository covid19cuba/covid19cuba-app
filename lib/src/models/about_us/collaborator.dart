// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'collaborator.g.dart';

@JsonSerializable()
class Collaborator {
  String name;
  String url;

  Collaborator();

  factory Collaborator.fromJson(Map<String, dynamic> json) =>
      _$CollaboratorFromJson(json);

  Map<String, dynamic> toJson() => _$CollaboratorToJson(this);
}
