// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:covid19cuba/src/models/protocols/protocol.dart';
import 'package:json_annotation/json_annotation.dart';

part 'protocols.g.dart';

@JsonSerializable()
class Protocols extends Model {
  List<Protocol> protocols;

  Protocols();

  factory Protocols.fromJson(Map<String, dynamic> json) =>
      _$ProtocolsFromJson(json);

  Map<String, dynamic> toJson() => _$ProtocolsToJson(this);
}
