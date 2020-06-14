// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'radar_bound_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RadarBoundModel {
  @JsonKey(name: 'stringency')
  double stringency;

  @JsonKey(name: 'deaths_p')
  double deathPercent;

  @JsonKey(name: 'recovered_p')
  double recoveredPercent;

  @JsonKey(name: 'test_p')
  double testPercent;

  RadarBoundModel();

  factory RadarBoundModel.fromJson(Map<String, dynamic> json) =>
      _$RadarBoundModelFromJson(json);

  Map<String, dynamic> toJson() => _$RadarBoundModelToJson(this);
}
