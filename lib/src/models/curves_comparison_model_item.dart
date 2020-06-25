// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'curves_comparison_model_item.g.dart';

@JsonSerializable()
class CurvesComparisonModelItem {
  List<int> confirmed;
  List<int> deaths;
  List<int> recovered;
  List<int> daily;
  List<int> active;
  List<double> stringency;
  String name;

  CurvesComparisonModelItem();

  factory CurvesComparisonModelItem.fromJson(Map<String, dynamic> json) =>
      _$CurvesComparisonModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$CurvesComparisonModelItemToJson(this);
}
