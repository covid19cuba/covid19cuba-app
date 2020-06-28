// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evolution_of_recovered_by_days.g.dart';

@JsonSerializable()
class EvolutionOfRecoveredByDays {
  ItemList accumulated;
  ItemList daily;
  ItemDateList date;

  EvolutionOfRecoveredByDays();

  factory EvolutionOfRecoveredByDays.fromJson(Map<String, dynamic> json) =>
      _$EvolutionOfRecoveredByDaysFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionOfRecoveredByDaysToJson(this);
}
