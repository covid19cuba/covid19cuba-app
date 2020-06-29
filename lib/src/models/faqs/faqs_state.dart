// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faqs_state.g.dart';

@JsonSerializable()
class FaqsState extends CacheModel {
  FaqsState();

  static FaqsState fromJson(Map<String, dynamic> json) =>
      _$FaqsStateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FaqsStateToJson(this);
}
