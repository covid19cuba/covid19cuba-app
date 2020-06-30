// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'critics_serious_evolution.g.dart';

@JsonSerializable()
class CriticsSeriousEvolution {
  ItemDateList date;
  ItemList critics;
  ItemList serious;

  CriticsSeriousEvolution();

  factory CriticsSeriousEvolution.fromJson(Map<String, dynamic> json) =>
      _$CriticsSeriousEvolutionFromJson(json);

  Map<String, dynamic> toJson() => _$CriticsSeriousEvolutionToJson(this);
}
