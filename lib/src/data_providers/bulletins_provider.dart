// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/bulletins/bulletins.dart';
import 'package:covid19cuba/src/models/bulletins/bulletins_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class BulletinsProvider extends DataProvider<Bulletins, BulletinsState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/bulletins.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/bulletins.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/bulletins_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/bulletins_state.json';

  @override
  String get prefData => Constants.prefBulletins;

  @override
  String get prefHash => Constants.prefBulletinsState;

  @override
  Bulletins dataFromJson(Map<String, dynamic> data) => Bulletins.fromJson(data);

  @override
  BulletinsState dataStateFromJson(Map<String, dynamic> data) =>
      BulletinsState.fromJson(data);
}
