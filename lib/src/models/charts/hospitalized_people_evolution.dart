// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospitalized_people_evolution.g.dart';

@JsonSerializable()
class HospitalizedPeopleEvolution {
  ItemList unconfirmed;
  ItemList confirmed;
  ItemDateList date;

  HospitalizedPeopleEvolution();

  factory HospitalizedPeopleEvolution.fromJson(
          Map<String, dynamic> json) =>
      _$HospitalizedPeopleEvolutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HospitalizedPeopleEvolutionToJson(this);
}
