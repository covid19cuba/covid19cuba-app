// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/municipalities.dart';
import 'package:covid19cuba/src/models/charts/national.dart';
import 'package:covid19cuba/src/models/charts/provinces.dart';
import 'package:covid19cuba/src/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Data {
  @JsonKey(name: 'all')
  National all;

  @JsonKey(name: 'provinces')
  Map<String, Provinces> provinces;

  Data();

  Municipalities getMunicipality(String code) {
    if (code == '40.01') {
      return provinces['ijv'].municipalities[code];
    }
    var prov = code.split('.')[0];
    var abbr = Constants.provincesCodes[prov];
    return provinces[abbr].municipalities[code];
  }

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
