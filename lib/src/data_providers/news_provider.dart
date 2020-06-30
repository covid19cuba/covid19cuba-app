// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/news/news.dart';
import 'package:covid19cuba/src/models/news/news_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:preferences/preferences.dart';

class NewsProvider extends DataProvider<News, NewsState> {
  @override
  String get urlDataCU =>
      'https://cusobu.nat.cu/covid/api/v2/news.json';

  @override
  String get urlDataIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/news.json';

  @override
  String get urlDataStateCU =>
      'https://cusobu.nat.cu/covid/api/v2/news_state.json';

  @override
  String get urlDataStateIO =>
      'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/news_state.json';

  @override
  String get prefData => Constants.prefNews;

  @override
  String get prefHash => Constants.prefNewsState;

  @override
  News dataFromJson(Map<String, dynamic> data) => News.fromJson(data);

  @override
  NewsState dataStateFromJson(Map<String, dynamic> data) =>
      NewsState.fromJson(data);

  @override
  void executeOk() {
    PrefService.setBool(Constants.prefBadgeNews, true);
  }
}
