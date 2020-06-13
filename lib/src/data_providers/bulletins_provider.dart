// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'data_provider.dart';
import '../models/bulletins.dart';
import '../models/bulletins_state.dart';
import '../utils/utils.dart';
import 'data_resolver.dart';


class BulletinProvider extends DataProvider<Bulletins> implements DataResolver<Bulletins>{
  static const String cuDataPath = "/api/v2/bulletins.json";
  static const String ioDataPath = cuDataPath;

  static const String cuStatePath = "/api/v2/bulletins_state.json";
  static const String ioStatePath = cuStatePath;

  static const bulletinState = DataProvider(
      cuPath: cuStatePath, ioPath: ioStatePath, parser: BulletinState.fromJson);

  const BulletinProvider() : super(
      cuPath: cuDataPath, ioPath: ioDataPath, parser: Bulletins.fromJson);

  @override
  Future<Bulletins> getDataOrCache() {
    return getDataAndCacheCheck(dataProvider: this,
        cacheProvider: BulletinProvider.bulletinState,
        dataStateKey: Constants.prefBulletinState,
        dataCacheKey: Constants.prefBulletins);
  }

  @override
  Future<Bulletins> getCache() {
    return getDataFromCache(this, Constants.prefBulletinState);
  }
}