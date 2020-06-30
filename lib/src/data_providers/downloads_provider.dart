// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/downloads/downloads.dart';
import 'package:covid19cuba/src/models/downloads/downloads_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class DownloadsProvider extends DataProvider<Downloads, DownloadsState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/downloads.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/downloads.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/downloads_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/downloads_state.json';

  @override
  String get prefData => Constants.prefDownloads;

  @override
  String get prefHash => Constants.prefDownloadsState;

  @override
  Downloads dataFromJson(Map<String, dynamic> data) =>
      Downloads.fromJson(data);

  @override
  DownloadsState dataStateFromJson(Map<String, dynamic> data) =>
      DownloadsState.fromJson(data);
}
