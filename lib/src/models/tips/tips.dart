// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:covid19cuba/src/models/tips/tips_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tips.g.dart';

@JsonSerializable()
class Tips extends Model {
  List<TipsItem> tips;

  Tips();

  factory Tips.fromJson(Map<String, dynamic> json) =>
      _$TipsFromJson(json);

  Map<String, dynamic> toJson() => _$TipsToJson(this);
}
