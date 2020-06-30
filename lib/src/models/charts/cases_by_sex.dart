// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cases_by_sex.g.dart';

@JsonSerializable()
class CasesBySex {
  Item men;
  Item women;
  Item unknown;

  CasesBySex();

  factory CasesBySex.fromJson(Map<String, dynamic> json) =>
      _$CasesBySexFromJson(json);

  Map<String, dynamic> toJson() => _$CasesBySexToJson(this);
}
