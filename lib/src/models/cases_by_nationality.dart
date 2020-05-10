// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'cases_by_nationality.g.dart';

@JsonSerializable()
class CasesByNationality {
  Item foreign;
  Item cubans;
  Item unknown;

  CasesByNationality();

  factory CasesByNationality.fromJson(Map<String, dynamic> json) =>
      _$CasesByNationalityFromJson(json);

  Map<String, dynamic> toJson() => _$CasesByNationalityToJson(this);
}
