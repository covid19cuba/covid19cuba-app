// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_double_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'percent_critics_serious_to_actives.g.dart';

@JsonSerializable()
class PercentCriticsSeriousToActives {
  ItemDateList date;
  ItemDoubleList percents;

  PercentCriticsSeriousToActives();

  factory PercentCriticsSeriousToActives.fromJson(Map<String, dynamic> json) =>
      _$PercentCriticsSeriousToActivesFromJson(json);

  Map<String, dynamic> toJson() => _$PercentCriticsSeriousToActivesToJson(this);
}
