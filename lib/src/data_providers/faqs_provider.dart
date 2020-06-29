// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/faqs/faqs.dart';
import 'package:covid19cuba/src/models/faqs/faqs_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class FaqsProvider extends DataProvider<Faqs, FaqsState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/faqs.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/faqs.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/faqs_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/faqs_state.json';

  @override
  String get prefData => Constants.prefFaqs;

  @override
  String get prefHash => Constants.prefFaqsState;

  @override
  Faqs dataFromJson(Map<String, dynamic> data) =>
      Faqs.fromJson(data);

  @override
  FaqsState dataStateFromJson(Map<String, dynamic> data) =>
      FaqsState.fromJson(data);
}
