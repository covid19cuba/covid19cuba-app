// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_double.dart';
import 'package:json_annotation/json_annotation.dart';

part 'percent_of_symptomatics_and_asymptomatics.g.dart';

@JsonSerializable()
class PercentSymptomaticsAsymptomatics {
  ItemDouble symptomatics;
  ItemDouble asymptomatics;

  PercentSymptomaticsAsymptomatics();

  factory PercentSymptomaticsAsymptomatics.fromJson(
          Map<String, dynamic> json) =>
      _$PercentSymptomaticsAsymptomaticsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PercentSymptomaticsAsymptomaticsToJson(this);
}
