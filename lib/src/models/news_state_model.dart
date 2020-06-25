// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/utils/utils.dart';

part 'news_state_model.g.dart';

@JsonSerializable()
class NewsStateModel {
  String cache;

  NewsStateModel();

  static Future<List<bool>> check() async {
    try {
      var state = await getNewsStateData();
      var cacheNew = state.cache;
      var cacheOld = PrefService.getString(Constants.prefCacheNewsHash) ?? "";
      var cache = cacheNew != cacheOld;
      return List<bool>()..add(cache);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  factory NewsStateModel.fromJson(Map<String, dynamic> json) =>
      _$NewsStateModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsStateModelToJson(this);
}
