// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/data_providers/data_provider.dart';
import 'package:covid19cuba/src/data_providers/data_resolver.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class BulletinsProvider extends DataProvider<Bulletins>
    implements DataResolver<Bulletins, BulletinsProvider> {
  static const String cuDataPath = '/api/v2/bulletins.json';
  static const String ioDataPath = cuDataPath;

  static const String cuStatePath = '/api/v2/bulletins_state.json';
  static const String ioStatePath = cuStatePath;

  static const bulletinState = DataProvider(
    cuPath: cuStatePath,
    ioPath: ioStatePath,
    parser: BulletinState.fromJson,
  );

  const BulletinsProvider()
      : super(
          cuPath: cuDataPath,
          ioPath: ioDataPath,
          parser: Bulletins.fromJson,
        );

  @override
  Future<Bulletins> getDataOrCache() {
    return getDataAndCacheCheck(
        dataProvider: this,
        cacheProvider: BulletinsProvider.bulletinState,
        dataStateKey: Constants.prefBulletinState,
        dataCacheKey: Constants.prefBulletins);
  }

  @override
  Future<Bulletins> getCache() {
    return getDataFromCache(this, Constants.prefBulletinState);
  }

  @override
  BulletinsProvider createInstance() {
    return BulletinsProvider();
  }

  @override
  Future<void> setCache(Bulletins data) {
    return setDataToCache(data, Constants.prefBulletins);
  }
}
