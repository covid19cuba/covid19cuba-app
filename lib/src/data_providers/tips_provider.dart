// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/tips/tips.dart';
import 'package:covid19cuba/src/models/tips/tips_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class TipsProvider extends DataProvider<Tips, TipsState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/tips.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/tips.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/tips_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/tips_state.json';

  @override
  String get prefData => Constants.prefTips;

  @override
  String get prefHash => Constants.prefTipsState;

  @override
  Tips dataFromJson(Map<String, dynamic> data) =>
      Tips.fromJson(data);

  @override
  TipsState dataStateFromJson(Map<String, dynamic> data) =>
      TipsState.fromJson(data);
}
