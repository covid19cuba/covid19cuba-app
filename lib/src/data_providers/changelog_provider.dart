// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/changelog/changelog.dart';
import 'package:covid19cuba/src/models/changelog/changelog_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class ChangelogProvider extends DataProvider<Changelog, ChangelogState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/changelog.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/changelog.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/changelog_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/changelog_state.json';

  @override
  String get prefData => Constants.prefChangelog;

  @override
  String get prefHash => Constants.prefChangelogState;

  @override
  Changelog dataFromJson(Map<String, dynamic> data) =>
      Changelog.fromJson(data);

  @override
  ChangelogState dataStateFromJson(Map<String, dynamic> data) =>
      ChangelogState.fromJson(data);
}
