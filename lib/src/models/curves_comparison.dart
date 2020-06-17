// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/curves_comparison_model_item.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'curves_comparison.g.dart';

@JsonSerializable()
class CurvesComparisonModel {
  @JsonKey(name: 'data')
  Map<String, CurvesComparisonModelItem> countries;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime updated;

  CurvesComparisonModel();

  factory CurvesComparisonModel.fromJson(Map<String, dynamic> json) =>
      _$CurvesComparisonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurvesComparisonModelToJson(this);
}
