// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'radar_data_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RadarDataModel {
  @JsonKey(name: 'data')
  Map<String, RadarData> data;

  @JsonKey(name: 'countries')
  List<String> countries;

  @JsonKey(name: 'bounds')
  RadarBound bounds;

  RadarDataModel();

  factory RadarDataModel.fromJson(Map<String, dynamic> json) =>
      _$RadarDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RadarDataModelToJson(this);
}
