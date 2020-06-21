// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'bulletin_provider.dart';

part 'bulletins.g.dart';

@JsonSerializable()
class Bulletins extends Model {
  List<BulletinProvider> providers;

  Bulletins();

  static Bulletins fromJson(Map<String, dynamic> json) =>
      _$BulletinsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BulletinsToJson(this);
}
