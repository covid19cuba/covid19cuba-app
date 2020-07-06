// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/utils/functions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_date_list.g.dart';

@JsonSerializable()
class ItemDateList {
  String name;

  @JsonKey(fromJson: dateTimeListFromJson, toJson: dateTimeListToJson)
  List<DateTime> values;

  ItemDateList();

  factory ItemDateList.fromJson(Map<String, dynamic> json) =>
      _$ItemDateListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDateListToJson(this);
}
