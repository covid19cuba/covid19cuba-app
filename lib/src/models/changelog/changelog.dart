// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/changelog/changelog_item.dart';
import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'changelog.g.dart';

@JsonSerializable()
class Changelog extends Model {
  List<ChangelogItem> changelog;

  Changelog();

  factory Changelog.fromJson(Map<String, dynamic> json) =>
      _$ChangelogFromJson(json);

  Map<String, dynamic> toJson() => _$ChangelogToJson(this);
}
