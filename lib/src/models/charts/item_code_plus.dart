// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'item_code_plus.g.dart';

@JsonSerializable()
class ItemCodePlus {
  String code;
  String name;
  int value;
  int men;
  int women;
  int unknown;

  ItemCodePlus();

  factory ItemCodePlus.fromJson(Map<String, dynamic> json) =>
      _$ItemCodePlusFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCodePlusToJson(this);
}
