// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'radar_bound.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RadarBound {
  @JsonKey(name: 'stringency')
  double stringency;

  @JsonKey(name: 'deaths_p')
  double deathPercent;

  @JsonKey(name: 'recovered_p')
  double recoveredPercent;

  @JsonKey(name: 'test_p')
  double testPercent;

  RadarBound();

  factory RadarBound.fromJson(Map<String, dynamic> json) =>
      _$RadarBoundFromJson(json);

  Map<String, dynamic> toJson() => _$RadarBoundToJson(this);
}
