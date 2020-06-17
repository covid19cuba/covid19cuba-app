// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'multiple_comparison_of_cuba_with_radar_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class MultipleComparisonOfCubaWithRadarModel {
  @JsonKey(name: 'data')
  Map<String, RadarItemModel> data;

  @JsonKey(name: 'bounds')
  RadarBoundModel bounds;

  MultipleComparisonOfCubaWithRadarModel();

  factory MultipleComparisonOfCubaWithRadarModel.fromJson(
          Map<String, dynamic> json) =>
      _$MultipleComparisonOfCubaWithRadarModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MultipleComparisonOfCubaWithRadarModelToJson(this);
}
