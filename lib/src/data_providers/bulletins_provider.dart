import 'package:demoji/demoji.dart';

import 'data_provider.dart';
import '../models/bulletins.dart';
import '../models/bulletins_state.dart';

const String cuDataPath = "/api/v2/bulletins.json";
const String ioDataPath = cuDataPath;

const String cuStatePath = "/api/v2/bulletins_state.json";
const String ioStatePath = cuStatePath;

const BulletinDataProvider = DataProvider(cuPath: cuDataPath, ioPath: ioDataPath, parser: Bulletins.fromJson);
const BulletinStateProvider = DataProvider(cuPath: cuStatePath, ioPath: ioStatePath, parser: BulletinState.fromJson);