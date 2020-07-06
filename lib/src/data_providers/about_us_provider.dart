// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/about_us/about_us.dart';
import 'package:covid19cuba/src/models/about_us/about_us_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class AboutUsProvider extends DataProvider<AboutUs, AboutUsState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/about_us.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/about_us.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/about_us_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/about_us_state.json';

  @override
  String get prefData => Constants.prefAboutUs;

  @override
  String get prefHash => Constants.prefAboutUsState;

  @override
  AboutUs dataFromJson(Map<String, dynamic> data) => AboutUs.fromJson(data);

  @override
  AboutUsState dataStateFromJson(Map<String, dynamic> data) =>
      AboutUsState.fromJson(data);
}
