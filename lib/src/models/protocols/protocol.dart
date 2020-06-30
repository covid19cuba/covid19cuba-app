// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/protocols/indication.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'protocol.g.dart';

@JsonSerializable()
class Protocol {
  String id;
  String name;
  String link;
  int version;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime date;
  List<Indication> indications;

  Protocol();

  factory Protocol.fromJson(Map<String, dynamic> json) =>
      _$ProtocolFromJson(json);

  Map<String, dynamic> toJson() => _$ProtocolToJson(this);
}
