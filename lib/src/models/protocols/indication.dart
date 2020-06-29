// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/protocols/scenario.dart';
import 'package:json_annotation/json_annotation.dart';

part 'indication.g.dart';

@JsonSerializable()
class Indication {
  String id;
  String name;
  String abbreviation;
  String category;
  String description;
  bool update;
  List<Scenario> scenarios;

  Indication();

  factory Indication.fromJson(Map<String, dynamic> json) =>
      _$IndicationFromJson(json);

  Map<String, dynamic> toJson() => _$IndicationToJson(this);
}
