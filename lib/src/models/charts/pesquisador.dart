// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'pesquisador.g.dart';

@JsonSerializable()
class Pesquisador {
  String url;
  String javascript;
  String contains;

  Pesquisador();

  factory Pesquisador.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorFromJson(json);

  Map<String, dynamic> toJson() => _$PesquisadorToJson(this);
}
