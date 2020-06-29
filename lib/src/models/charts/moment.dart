// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/utils/utils.dart';

part 'moment.g.dart';

@JsonSerializable()
class Moment {
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime date;
  String value;

  Moment();

  factory Moment.fromJson(Map<String, dynamic> json) =>
      _$MomentFromJson(json);

  Map<String, dynamic> toJson() => _$MomentToJson(this);
}
