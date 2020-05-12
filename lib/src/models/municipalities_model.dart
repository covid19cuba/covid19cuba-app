// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'municipalities_model.g.dart';

@JsonSerializable()
class MunicipalitiesModel {
  MunicipalityModel all;

  MunicipalitiesModel();

  factory MunicipalitiesModel.fromJson(Map<String, dynamic> json) =>
      _$MunicipalitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MunicipalitiesModelToJson(this);
}
