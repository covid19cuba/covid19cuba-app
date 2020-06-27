// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bulletins_item.g.dart';

@JsonSerializable()
class BulletinsItem extends Model {
  String id;
  String info;
  String url;
  double size;

  BulletinsItem();

  static BulletinsItem fromJson(Map<String, dynamic> json) =>
      _$BulletinsItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BulletinsItemToJson(this);
}
