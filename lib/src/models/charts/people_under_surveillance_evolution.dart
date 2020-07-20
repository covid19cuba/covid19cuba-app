// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people_under_surveillance_evolution.g.dart';

@JsonSerializable()
class PeopleUnderSurveillanceEvolution {
  ItemList hospitalized;
  @JsonKey(name: 'home_surveillance')
  ItemList homeSurveillance;
  ItemDateList date;

  PeopleUnderSurveillanceEvolution();

  factory PeopleUnderSurveillanceEvolution.fromJson(
          Map<String, dynamic> json) =>
      _$PeopleUnderSurveillanceEvolutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PeopleUnderSurveillanceEvolutionToJson(this);
}
