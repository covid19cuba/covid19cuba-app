// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/municipalities.dart';
import 'package:covid19cuba/src/models/charts/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provinces.g.dart';

@JsonSerializable()
class Provinces {
  Province all;
  Map<String, Municipalities> municipalities;

  Provinces();

  factory Provinces.fromJson(Map<String, dynamic> json) =>
      _$ProvincesFromJson(json);

  Map<String, dynamic> toJson() => _$ProvincesToJson(this);
}
