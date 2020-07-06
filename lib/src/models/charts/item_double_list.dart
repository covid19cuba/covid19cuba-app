// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'item_double_list.g.dart';

@JsonSerializable()
class ItemDoubleList {
  String name;
  List<double> values;

  ItemDoubleList();

  factory ItemDoubleList.fromJson(Map<String, dynamic> json) =>
      _$ItemDoubleListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDoubleListToJson(this);
}
