// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/moment.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stringency_index_cuba.g.dart';

@JsonSerializable()
class StringencyIndexCuba {
  @JsonKey(fromJson: dateTimeListFromJson, toJson: dateTimeListToJson)
  List<DateTime> days;
  List<double> data;
  @JsonKey(name: 'data-legacy')
  List<double> dataLegacy;
  List<Moment> moments;

  StringencyIndexCuba();

  factory StringencyIndexCuba.fromJson(Map<String, dynamic> json) =>
      _$StringencyIndexCubaFromJson(json);

  Map<String, dynamic> toJson() => _$StringencyIndexCubaToJson(this);
}
