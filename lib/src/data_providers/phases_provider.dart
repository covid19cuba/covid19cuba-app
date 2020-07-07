// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/phases/phases.dart';
import 'package:covid19cuba/src/models/phases/phases_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class PhasesProvider extends DataProvider<Phases, PhasesState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/phases.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/phases.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/phases_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/phases_state.json';

  @override
  String get prefData => Constants.prefPhases;

  @override
  String get prefHash => Constants.prefPhasesState;

  @override
  Phases dataFromJson(Map<String, dynamic> data) =>
      Phases.fromJson(data);

  @override
  PhasesState dataStateFromJson(Map<String, dynamic> data) =>
      PhasesState.fromJson(data);
}
