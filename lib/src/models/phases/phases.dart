// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:covid19cuba/src/models/phases/phases_category.dart';
import 'package:covid19cuba/src/models/phases/phases_item.dart';
import 'package:covid19cuba/src/models/phases/phases_measure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phases.g.dart';

@JsonSerializable()
class Phases extends Model {
  List<PhasesItem> phases;
  Map<String, PhasesCategory> categories;
  Map<String, PhasesMeasure> measures;
  @JsonKey(name: 'intro_explanation')
  String introExplanation;
  @JsonKey(name: 'button_explanation')
  String buttonExplanation;
  @JsonKey(name: 'title_explanation')
  String titleExplanation;
  @JsonKey(name: 'content_explanation')
  String contentExplanation;

  Phases();

  factory Phases.fromJson(Map<String, dynamic> json) => _$PhasesFromJson(json);

  Map<String, dynamic> toJson() => _$PhasesToJson(this);
}
