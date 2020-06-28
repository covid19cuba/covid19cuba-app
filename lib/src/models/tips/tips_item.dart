// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'tips_item.g.dart';

@JsonSerializable()
class TipsItem {
  String header;
  String info;

  TipsItem();

  factory TipsItem.fromJson(Map<String, dynamic> json) =>
      _$TipsItemFromJson(json);

  Map<String, dynamic> toJson() => _$TipsItemToJson(this);
}
