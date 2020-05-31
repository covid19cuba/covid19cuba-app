// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'radar_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RadarModel {
  @JsonKey(name: 'data')
  Map<String, RadarItemModel> data;

  @JsonKey(name: 'bounds')
  RadarBoundModel bounds;

  RadarModel();

  factory RadarModel.fromJson(Map<String, dynamic> json) =>
      _$RadarModelFromJson(json);

  Map<String, dynamic> toJson() => _$RadarModelToJson(this);
}
