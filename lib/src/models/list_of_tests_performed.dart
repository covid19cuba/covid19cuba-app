// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'list_of_tests_performed.g.dart';

@JsonSerializable()
class ListOfTestsPerformed {
  Item positive;
  Item negative;
  Item total;

  ListOfTestsPerformed();

  factory ListOfTestsPerformed.fromJson(Map<String, dynamic> json) =>
      _$ListOfTestsPerformedFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfTestsPerformedToJson(this);
}
