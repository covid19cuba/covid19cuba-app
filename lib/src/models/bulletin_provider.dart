// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';
import 'bulletin.dart';

part 'bulletin_provider.g.dart';

@JsonSerializable()
class BulletinProvider{
  String name;
  String url;
  String data_source;
  List<Bulletin> bulletins;

  BulletinProvider();

  static BulletinProvider fromJson(Map<String,dynamic> json) => _$BulletinProviderFromJson(json);

  Map<String, dynamic> toJson() => _$BulletinProviderToJson(this);
}