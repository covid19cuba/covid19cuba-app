import 'data_provider.dart';
import '../models/bulletins.dart';
import '../models/bulletins_state.dart';
import '../utils/utils.dart';


class BulletinProvider extends DataProvider<Bulletins> {
  static const String cuDataPath = "/api/v2/bulletins.json";
  static const String ioDataPath = cuDataPath;

  static const String cuStatePath = "/api/v2/bulletins_state.json";
  static const String ioStatePath = cuStatePath;

  static const bulletinState = DataProvider(
      cuPath: cuStatePath, ioPath: ioStatePath, parser: BulletinState.fromJson);

  const BulletinProvider() : super(
      cuPath: cuDataPath, ioPath: ioDataPath, parser: Bulletins.fromJson);

  Future<Bulletins> getDataOrCache() {
    return getDataAndCacheCheck(dataProvider: this,
        cacheProvider: BulletinProvider.bulletinState,
        dataStateKey: Constants.prefBulletinState,
        dataCacheKey: Constants.prefBulletins);
  }

  Future<Bulletins> getCacheData() {
    return getDataFromCache(this, Constants.prefBulletinState);
  }

}
//
//const BulletinDataProvider = DataProvider(
//    cuPath: cuDataPath, ioPath: ioDataPath, parser: Bulletins.fromJson);
//const BulletinStateProvider = DataProvider(
//    cuPath: cuStatePath, ioPath: ioStatePath, parser: BulletinState.fromJson);