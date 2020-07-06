// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'test_behavior_comparison.g.dart';

@JsonSerializable()
class TestBehaviorComparison {
  String name;
  @JsonKey(name: 'test_efectivity')
  double testEffectiveness;
  @JsonKey(name: 'total_tests_per_million')
  double totalTestsPerMillion;
  int total;

  TestBehaviorComparison();

  factory TestBehaviorComparison.fromJson(Map<String, dynamic> json) =>
      _$TestBehaviorComparisonFromJson(json);

  Map<String, dynamic> toJson() => _$TestBehaviorComparisonToJson(this);
}
