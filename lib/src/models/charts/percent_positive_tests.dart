// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_double_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'percent_positive_tests.g.dart';

@JsonSerializable()
class PercentPositiveTests {
  ItemDateList date;
  ItemDoubleList daily;
  ItemDoubleList accumulated;

  PercentPositiveTests();

  factory PercentPositiveTests.fromJson(Map<String, dynamic> json) =>
      _$PercentPositiveTestsFromJson(json);

  Map<String, dynamic> toJson() => _$PercentPositiveTestsToJson(this);
}
