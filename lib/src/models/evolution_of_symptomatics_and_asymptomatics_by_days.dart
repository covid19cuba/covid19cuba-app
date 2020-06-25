// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evolution_of_symptomatics_and_asymptomatics_by_days.g.dart';

@JsonSerializable()
class EvolutionSymptomaticsAsymptomaticsDays {
  ItemDateList date;
  ItemList symptomatics;
  ItemList asymptomatics;

  EvolutionSymptomaticsAsymptomaticsDays();

  factory EvolutionSymptomaticsAsymptomaticsDays.fromJson(
          Map<String, dynamic> json) =>
      _$EvolutionSymptomaticsAsymptomaticsDaysFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EvolutionSymptomaticsAsymptomaticsDaysToJson(this);
}
