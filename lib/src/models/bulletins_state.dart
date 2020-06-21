// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'state.dart';

part 'bulletins_state.g.dart';

@JsonSerializable()
class BulletinState extends Model with CacheState {
  BulletinState();

  static BulletinState fromJson(Map<String, dynamic> json) =>
      _$BulletinStateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BulletinStateToJson(this);
}
