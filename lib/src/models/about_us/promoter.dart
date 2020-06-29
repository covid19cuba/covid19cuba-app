// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'promoter.g.dart';

@JsonSerializable()
class Promoter {
  String name;
  String url;

  factory Promoter.fromJson(Map<String, dynamic> json) =>
      _$PromoterFromJson(json);

  Map<String, dynamic> toJson() => _$PromoterToJson(this);

  Promoter();
}
