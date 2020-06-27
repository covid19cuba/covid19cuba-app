// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'faqs_item.g.dart';

@JsonSerializable()
class FaqsItem {
  String title;
  String body;

  FaqsItem();

  factory FaqsItem.fromJson(Map<String, dynamic> json) =>
      _$FaqsItemFromJson(json);

  Map<String, dynamic> toJson() => _$FaqsItemToJson(this);
}
