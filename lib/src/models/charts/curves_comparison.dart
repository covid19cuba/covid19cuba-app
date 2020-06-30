// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/curves_comparison_item.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'curves_comparison.g.dart';

@JsonSerializable()
class CurvesComparison {
  @JsonKey(name: 'data')
  Map<String, CurvesComparisonItem> countries;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime updated;

  CurvesComparison();

  factory CurvesComparison.fromJson(Map<String, dynamic> json) =>
      _$CurvesComparisonFromJson(json);

  Map<String, dynamic> toJson() => _$CurvesComparisonToJson(this);
}
