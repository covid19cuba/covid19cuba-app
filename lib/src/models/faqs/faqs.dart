// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:covid19cuba/src/models/faqs/faqs_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faqs.g.dart';

@JsonSerializable()
class Faqs extends Model {
  List<FaqsItem> faqs;

  Faqs();

  factory Faqs.fromJson(Map<String, dynamic> json) =>
      _$FaqsFromJson(json);

  Map<String, dynamic> toJson() => _$FaqsToJson(this);
}
