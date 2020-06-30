// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'item_code.g.dart';

@JsonSerializable()
class ItemCode {
  String code;
  String name;
  int value;

  ItemCode();

  factory ItemCode.fromJson(Map<String, dynamic> json) =>
      _$ItemCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCodeToJson(this);
}
