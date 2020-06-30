// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distribution_of_cases.g.dart';

@JsonSerializable()
class DistributionOfCases {
  Item recovered;
  Item active;
  Item evacuees;
  Item deaths;
  Item cases;

  DistributionOfCases();

  factory DistributionOfCases.fromJson(Map<String, dynamic> json) =>
      _$DistributionOfCasesFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionOfCasesToJson(this);
}
