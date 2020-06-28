// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'item_municipality.g.dart';

@JsonSerializable()
class ItemMunicipality {
  int value;
  String name;
  int total;
  String province;

  ItemMunicipality();

  factory ItemMunicipality.fromJson(Map<String, dynamic> json) =>
      _$ItemMunicipalityFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMunicipalityToJson(this);
}
