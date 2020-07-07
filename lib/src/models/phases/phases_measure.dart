// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'phases_measure.g.dart';

@JsonSerializable()
class PhasesMeasure {
  String text;
  String category;
  List<int> phases;

  PhasesMeasure();

  factory PhasesMeasure.fromJson(Map<String, dynamic> json) =>
      _$PhasesMeasureFromJson(json);

  Map<String, dynamic> toJson() => _$PhasesMeasureToJson(this);
}
