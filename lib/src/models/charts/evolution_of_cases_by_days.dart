// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evolution_of_cases_by_days.g.dart';

@JsonSerializable()
class EvolutionOfCasesByDays {
  ItemList accumulated;
  ItemList daily;
  ItemList active;
  ItemDateList date;

  EvolutionOfCasesByDays();

  factory EvolutionOfCasesByDays.fromJson(Map<String, dynamic> json) =>
      _$EvolutionOfCasesByDaysFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionOfCasesByDaysToJson(this);
}
