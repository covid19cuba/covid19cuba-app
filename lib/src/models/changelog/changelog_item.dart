// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'changelog_item.g.dart';

@JsonSerializable()
class ChangelogItem {
  String version;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime date;
  List<String> changed;
  List<String> added;
  List<String> fixed;
  List<String> deleted;

  ChangelogItem();

  factory ChangelogItem.fromJson(Map<String, dynamic> json) =>
      _$ChangelogItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChangelogItemToJson(this);
}
