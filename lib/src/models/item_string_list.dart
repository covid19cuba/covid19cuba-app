// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'item_string_list.g.dart';

@JsonSerializable()
class ItemStringList {
  String name;
  List<String> values;

  ItemStringList();

  factory ItemStringList.fromJson(Map<String, dynamic> json) =>
      _$ItemStringListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemStringListToJson(this);
}
