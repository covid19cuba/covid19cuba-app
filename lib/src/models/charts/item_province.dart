// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'item_province.g.dart';

@JsonSerializable()
class ItemProvince {
  int value;
  String name;
  int total;
  int population;

  ItemProvince();

  factory ItemProvince.fromJson(Map<String, dynamic> json) =>
      _$ItemProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ItemProvinceToJson(this);
}
