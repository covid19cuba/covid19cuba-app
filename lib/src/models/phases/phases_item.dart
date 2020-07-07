// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'phases_item.g.dart';

@JsonSerializable()
class PhasesItem {
  int order;
  String name;
  List<String> provinces;
  List<String> measures;

  PhasesItem();

  factory PhasesItem.fromJson(Map<String, dynamic> json) =>
      _$PhasesItemFromJson(json);

  Map<String, dynamic> toJson() => _$PhasesItemToJson(this);
}
