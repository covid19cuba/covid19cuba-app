// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'bulletin.g.dart';

@JsonSerializable()
class Bulletin{
  String id;
  String info;
  String url;
  int size;

  Bulletin();

  static Bulletin fromJson(Map<String, dynamic> json) => _$BulletinFromJson(json);

  Map<String, dynamic> toJson() => _$BulletinToJson(this);
}
