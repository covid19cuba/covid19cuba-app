// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relation_of_tests_performed.g.dart';

@JsonSerializable()
class RelationOfTestsPerformed {
  Item positive;
  Item negative;
  Item total;

  RelationOfTestsPerformed();

  factory RelationOfTestsPerformed.fromJson(Map<String, dynamic> json) =>
      _$RelationOfTestsPerformedFromJson(json);

  Map<String, dynamic> toJson() => _$RelationOfTestsPerformedToJson(this);
}
