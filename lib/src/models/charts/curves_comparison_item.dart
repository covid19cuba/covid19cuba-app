// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'curves_comparison_item.g.dart';

@JsonSerializable()
class CurvesComparisonItem {
  List<int> confirmed;
  List<int> deaths;
  List<int> recovered;
  List<int> daily;
  List<int> active;
  List<double> stringency;
  String name;

  CurvesComparisonItem();

  factory CurvesComparisonItem.fromJson(Map<String, dynamic> json) =>
      _$CurvesComparisonItemFromJson(json);

  Map<String, dynamic> toJson() => _$CurvesComparisonItemToJson(this);
}
