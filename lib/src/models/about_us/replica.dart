// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'replica.g.dart';

@JsonSerializable()
class Replica {
  String text;
  String url;
  String replicaUrl;

  Replica();

  factory Replica.fromJson(Map<String, dynamic> json) =>
      _$ReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicaToJson(this);
}
