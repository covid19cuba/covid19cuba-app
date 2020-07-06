// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'radar_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RadarItem {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'confirmed_per_million')
  double confirmedPerMillion;

  @JsonKey(name: 'recovered_p')
  double recoveredPercent;

  @JsonKey(name: 'test_p')
  double testPercent;

  @JsonKey(name: 'deaths_p')
  double deathPercent;

  @JsonKey(name: 'stringency')
  double stringency;

  @JsonKey(name: 'test_per_million')
  double testPerMillion;

  @JsonKey(name: 'confirmed_per_million_bound')
  double confirmedPerMillionBound;

  @JsonKey(name: 'test_per_million_bound')
  double testPerMillionBound;

  RadarItem();

  factory RadarItem.fromJson(Map<String, dynamic> json) =>
      _$RadarItemFromJson(json);

  Map<String, dynamic> toJson() => _$RadarItemToJson(this);
}
