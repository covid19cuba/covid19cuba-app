// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/protocols/protocols.dart';
import 'package:covid19cuba/src/models/protocols/protocols_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class ProtocolsProvider extends DataProvider<Protocols, ProtocolsState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/protocols.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/protocols.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/protocols_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/protocols_state.json';

  @override
  String get prefData => Constants.prefProtocols;

  @override
  String get prefHash => Constants.prefProtocolsState;

  @override
  Protocols dataFromJson(Map<String, dynamic> data) => Protocols.fromJson(data);

  @override
  ProtocolsState dataStateFromJson(Map<String, dynamic> data) =>
      ProtocolsState.fromJson(data);
}
