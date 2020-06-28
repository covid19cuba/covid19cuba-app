// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item_date_list.dart';
import 'package:covid19cuba/src/models/charts/item_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tests_by_days.g.dart';

@JsonSerializable()
class TestsByDays {
  ItemDateList date;
  ItemList negative;
  ItemList positive;
  ItemList total;

  TestsByDays();

  factory TestsByDays.fromJson(Map<String, dynamic> json) =>
      _$TestsByDaysFromJson(json);

  Map<String, dynamic> toJson() => _$TestsByDaysToJson(this);
}
