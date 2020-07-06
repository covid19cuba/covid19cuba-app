// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'downloads_item.g.dart';

@JsonSerializable()
class DownloadsItem {
  String name;
  String format;
  String link;

  DownloadsItem();

  factory DownloadsItem.fromJson(Map<String, dynamic> json) =>
      _$DownloadsItemFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadsItemToJson(this);
}
