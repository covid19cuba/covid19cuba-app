// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/radar_bound.dart';
import 'package:covid19cuba/src/models/charts/radar_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'multiple_comparison_with_radar.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class MultipleComparisonWithRadar {
  @JsonKey(name: 'data')
  Map<String, RadarItem> data;

  @JsonKey(name: 'bounds')
  RadarBound bounds;

  MultipleComparisonWithRadar();

  factory MultipleComparisonWithRadar.fromJson(
          Map<String, dynamic> json) =>
      _$MultipleComparisonWithRadarFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MultipleComparisonWithRadarToJson(this);
}
