// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/data_providers/state_provider.dart';
import 'package:covid19cuba/src/utils/utils.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  int version;
  String cache;
  int days;

  StateModel();

  static Future<List<bool>> check() async {
    try {
      var state = await getStateData();
      var _days = getDayFromCache();
      var cacheNew = state.cache;
      var versionNew = state.version;
      var packageInfo = await PackageInfo.fromPlatform();
      var versionOld = int.parse(packageInfo.buildNumber);
      await PrefService.init();
      var cacheOld = PrefService.getString(Constants.prefCacheHash) ?? "";
      var version = versionNew > versionOld;
      var cache = cacheNew != cacheOld;
      var dataChange = state.days > _days;
      var versionSkip = PrefService.getInt(Constants.prefVersionLastSkip) ?? 0;
      return List<bool>()
        ..add(version)
        ..add(cache)
        ..add(versionNew > versionSkip)
        ..add(dataChange);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
