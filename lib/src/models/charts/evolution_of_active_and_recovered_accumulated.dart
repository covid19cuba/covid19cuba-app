// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evolution_of_active_and_recovered_accumulated.g.dart';

@JsonSerializable()
class EvolutionOfActiveAndRecoveredAccumulated {
  ItemList active;
  ItemList recovered;
  ItemDateList date;

  EvolutionOfActiveAndRecoveredAccumulated();

  factory EvolutionOfActiveAndRecoveredAccumulated.fromJson(
          Map<String, dynamic> json) =>
      _$EvolutionOfActiveAndRecoveredAccumulatedFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EvolutionOfActiveAndRecoveredAccumulatedToJson(this);
}
