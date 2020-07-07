// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'phases_category.g.dart';

@JsonSerializable()
class PhasesCategory {
  String name;
  @JsonKey(required: false)
  String parent;

  PhasesCategory();

  factory PhasesCategory.fromJson(Map<String, dynamic> json) =>
      _$PhasesCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$PhasesCategoryToJson(this);
}
