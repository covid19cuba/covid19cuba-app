// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'protocols_state.g.dart';

@JsonSerializable()
class ProtocolsState extends CacheModel {
  ProtocolsState();

  factory ProtocolsState.fromJson(Map<String, dynamic> json) =>
      _$ProtocolsStateFromJson(json);

  Map<String, dynamic> toJson() => _$ProtocolsStateToJson(this);
}
