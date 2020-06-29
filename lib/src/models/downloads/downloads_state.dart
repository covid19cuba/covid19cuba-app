// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'downloads_state.g.dart';

@JsonSerializable()
class DownloadsState extends CacheModel {
  DownloadsState();

  static DownloadsState fromJson(Map<String, dynamic> json) =>
      _$DownloadsStateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DownloadsStateToJson(this);
}
