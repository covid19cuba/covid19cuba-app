// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'tests_positive_percent.g.dart';

@JsonSerializable()
class TestsPositivePercent {
  ItemDateList date;
  ItemDoubleList daily;
  ItemDoubleList accumulated;

  TestsPositivePercent();

  factory TestsPositivePercent.fromJson(Map<String, dynamic> json) =>
      _$TestsPositivePercentFromJson(json);

  Map<String, dynamic> toJson() => _$TestsPositivePercentToJson(this);
}
