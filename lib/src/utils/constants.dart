import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Constants {
  static const String appName = 'Covid19 Cuba Data (Beta)';
  static const String appLogo = 'assets/images/logo.png';
  static const String diseaseName = 'Covid-19';
  static const Color primaryColor = Color.fromARGB(255, 28, 19, 64);
  static const int notificationMinutesRange = 1440;
  static const int setUpTasksMinutesDefault = 15;

  static const String defaultCompareCountry = 'Hungary';
  static const String countryCuba = 'Cuba';

  static const showMunicipalities = "covidData";
  static const showProvinces = "covidData2";

  //Shared preferences
  static const String prefIsOnBoarding = 'isOnBoarding';
  static const String prefCompareCountry = 'compareCountry';
  static const String prefConnectionMode = 'connectionMode';
  static const String prefLastDataUpdate = 'lastDataUpdate';
  static const String prefSetUpTasksMinutes = 'setUpTasksMinutes';
  static const String prefVersionCode = 'versionCode';
  static const String prefData = 'data';
  static const String prefCacheHash = 'cacheHash';
  static const String prefVersionLastSkip = 'versionLastSkip';
  static const String prefFirstCacheNotification = 'firstCacheNotification';
  static const String prefFirstVersionNotification = 'firstVersionNotification';

  //Connection Modes
  static const int ConnectionModeIntranet = 0;
  static const int ConnectionModeInternet = 1;
  static const int ConnectionModeMerge = 2;

  // Notifications ids
  static const int infoUpdateNotification = -1;
  static const int appUpdateNotification = -2;
  static const int clapsNotification = -3;

  static Time clapsTime = Time(20, 55, 00);

  static const int startSilentIime = 22;
  static const int endSilentTime = 9;

  static const String apklisUrl =
      "https://www.apklis.cu/application/club.postdata.covid19cuba";
  static const String githubUrl =
      "https://github.com/covid19cuba/covid19cuba-app/releases/latest/download/app.apk";

  static const String apklisBanner = "assets/images/apklis.png";
  static const String githubBanner = "assets/images/github.png";

  static const String apkUpdateText =
      'Ya está disponible una nueva versión de Covid19 Cuba Data.';

  static const provinceAbbreviations = <String, String>{
    'pri': 'Pinar del Río',
    'art': 'Artemisa',
    'lha': 'La Habana',
    'may': 'Mayabeque',
    'mat': 'Matanzas',
    'cfg': 'Cienfuegos',
    'vcl': 'Villa Clara',
    'ssp': 'Sancti Spíritus',
    'cav': 'Ciego de Ávila',
    'cam': 'Camagüey',
    'ltu': 'Las Tunas',
    'hol': 'Holguín',
    'gra': 'Granma',
    'stg': 'Santiago de Cuba',
    'gtm': 'Guantánamo',
    'ijv': 'Isla de la Juventud',
  };
}
