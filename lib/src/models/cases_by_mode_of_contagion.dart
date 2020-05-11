// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'cases_by_mode_of_contagion.g.dart';

@JsonSerializable()
class CasesByModeOfContagion {
  Item imported;
  Item inserted;
  Item autochthonous;
  Item unknown;

  CasesByModeOfContagion();

  factory CasesByModeOfContagion.fromJson(Map<String, dynamic> json) =>
      _$CasesByModeOfContagionFromJson(json);

  Map<String, dynamic> toJson() => _$CasesByModeOfContagionToJson(this);
}
