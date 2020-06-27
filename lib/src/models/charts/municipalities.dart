// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/municipality.dart';
import 'package:json_annotation/json_annotation.dart';

part 'municipalities.g.dart';

@JsonSerializable()
class Municipalities {
  Municipality all;

  Municipalities();

  factory Municipalities.fromJson(Map<String, dynamic> json) =>
      _$MunicipalitiesFromJson(json);

  Map<String, dynamic> toJson() => _$MunicipalitiesToJson(this);
}
