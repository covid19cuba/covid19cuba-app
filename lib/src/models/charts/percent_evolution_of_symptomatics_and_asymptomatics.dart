// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_double_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'percent_evolution_of_symptomatics_and_asymptomatics.g.dart';

@JsonSerializable()
class PercentEvolutionSymptomaticsAsymptomatics {
  ItemDateList date;
  ItemDoubleList symptomatics;
  ItemDoubleList asymptomatics;

  PercentEvolutionSymptomaticsAsymptomatics();

  factory PercentEvolutionSymptomaticsAsymptomatics.fromJson(
          Map<String, dynamic> json) =>
      _$PercentEvolutionSymptomaticsAsymptomaticsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PercentEvolutionSymptomaticsAsymptomaticsToJson(this);
}
