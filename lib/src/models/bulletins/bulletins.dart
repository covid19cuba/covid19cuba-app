// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/bulletins/bulletins_source.dart';
import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bulletins.g.dart';

@JsonSerializable()
class Bulletins extends Model {
  @JsonKey(name: 'providers')
  List<BulletinsSource> sources;

  Bulletins();

  factory Bulletins.fromJson(Map<String, dynamic> json) =>
      _$BulletinsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BulletinsToJson(this);
}
