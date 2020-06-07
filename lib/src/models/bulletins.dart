// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';
import 'bulletin_provider.dart';

part 'bulletins.g.dart';

@JsonSerializable()
class Bulletins{
  List<BulletinProvider> providers;

  Bulletins();

  factory Bulletins.fromJson(Map<String,dynamic> json) => _$BulletinsFromJson(json);

  Map<String, dynamic> toJson() => _$BulletinsToJson(this);
}


