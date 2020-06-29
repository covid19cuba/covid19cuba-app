// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:preferences/preferences.dart';

class DataCache {
  static const items = <DataCache>[
    DataCache(name: 'about_us', key: Constants.prefAboutUs),
    DataCache(name: 'bulletins', key: Constants.prefBulletins),
    DataCache(name: 'changelog', key: Constants.prefChangelog),
    DataCache(name: 'downloads', key: Constants.prefDownloads),
    DataCache(name: 'faqs', key: Constants.prefFaqs),
    DataCache(name: 'news', key: Constants.prefNews),
    DataCache(name: 'protocols', key: Constants.prefProtocols),
    DataCache(name: 'tips', key: Constants.prefTips),
    DataCache(name: 'full', key: Constants.prefData),
  ];

  static Future<void> init() async {
    for (var item in items) {
      var hasData = PrefService.getString(item.key) != null;
      if (hasData) continue;
      var content = await rootBundle.loadString(item.path);
      print(content);
      PrefService.setString(item.key, content);
    }
  }

  final String name;
  final String key;

  String get path => 'assets/data/$name.json';

  const DataCache({this.name, this.key});
}
