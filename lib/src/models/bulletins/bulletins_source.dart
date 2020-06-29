// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/bulletins/bulletins_item.dart';
import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bulletins_source.g.dart';

@JsonSerializable()
class BulletinsSource extends Model {
  String name;
  String url;
  @JsonKey(name: 'data_source')
  String dataSource;
  List<BulletinsItem> bulletins;

  BulletinsSource();

  factory BulletinsSource.fromJson(Map<String, dynamic> json) =>
      _$BulletinsSourceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BulletinsSourceToJson(this);
}
