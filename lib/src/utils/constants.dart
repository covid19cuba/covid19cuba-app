// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Constants {
  Constants._();

  static const String appName = 'Covid19 Cuba Data';
  static const String appLogo = 'assets/images/logo.png';
  static const String diseaseName = 'Covid-19';
  static const Color primaryColor = Color.fromARGB(255, 28, 19, 64);
  static const int notificationMinutesRange = 1440;
  static const int setUpTasksMinutesDefault = 15;

  static const String defaultCompareCountry = 'HUN';
  static const String countryCuba = 'CUB';

  static const showMunicipalities = "covidData";
  static const showProvinces = "covidData2";

  static const modeGeneral = 'general';
  static const modeDeceases = 'deceases';

  // Colors
  static const kBackgroundColor = Color(0xFFFEFEFE);
  static const kTitleTextColor = Color(0xFF303030);
  static const kBodyTextColor = Color(0xFF4B4B4B);
  static const kTextLightColor = Color(0xFF959595);
  static const kInfectedColor = Color(0xFFFF8748);
  static const kDeathColor = Color(0xFFFF4848);
  static const kRecoveredColor = Color(0xFF36C12C);
  static const kPrimaryColor = Color(0xFF3382CC);

  // Text Style
  static const kHeadingTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const kSubTextStyle = TextStyle(
    fontSize: 16,
    color: kTextLightColor,
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 18,
    color: kTitleTextColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle firstHeadingStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle secondHeadingStyle = TextStyle(
    color: Color(0xFF303030),
    fontSize: 27,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle topTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle headingTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black45,
  );

  static final TextStyle descStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  static final TextStyle moreDescStyle = TextStyle(
    fontSize: 16,
  );

  //Shared preferences
  static const String prefIsOnBoarding = 'isOnBoarding';
  static const String prefCompareCountry = 'compareCountry';
  static const String prefConnectionMode = 'connectionMode';
  static const String prefLastDataUpdate = 'lastDataUpdate';
  static const String prefSetUpTasksMinutes = 'setUpTasksMinutes';
  static const String prefVersionCode = 'versionCode';
  static const String prefData = 'data';
  static const String prefDataAboutUs = 'dataAboutUs';
  static const String prefCacheHash = 'cacheHash';
  static const String prefVersionLastSkip = 'versionLastSkip';
  static const String prefFirstCacheNotification = 'firstCacheNotification';
  static const String prefFirstVersionNotification = 'firstVersionNotification';
  static const String prefFirstModificationNotification =
      'firstModificationNotification';
  static const String prefPesquisador = 'prefPesquisador';
  static const String prefModeSelected = 'prefModeSelected';
  static const String prefProvinceSelected = 'prefProvinceSelected';
  static const String prefMunicipalitySelected = 'prefMunicipalitySelected';
  static const String prefContacts = 'prefContacts';
  static const String prefChartsZoom = 'prefChartsZoom';
  static const String prefBadgeNews = 'prefBadgeNews';
  static const String prefProxy = 'proxy';
  static const String prefProxyCredentials = 'proxy-authorization';
  static const String prefProxyHost = 'proxy-host';
  static const String prefProxyPort = 'proxy-port';
  static const String prefProxyCredentialsName = 'proxy-credentials-name';
  static const String prefProxyCredentialsPassword =
      'proxi-credentials-password';
  static const String prefProxyAllowInsecureCertificates =
      'proxy-insecure-certificates';
  static const String prefAboutUs = 'prefAboutUs';
  static const String prefAboutUsState = 'prefAboutUsState';
  static const String prefBulletins = 'prefBulletins';
  static const String prefBulletinsState = 'prefBulletinsState';
  static const String prefChangelog = 'prefChangelog';
  static const String prefChangelogState = 'prefChangelogState';
  static const String prefDownloads = 'prefDownloads';
  static const String prefDownloadsState = 'prefDownloadsState';
  static const String prefNews = 'prefNews';
  static const String prefNewsState = 'prefNewsState';
  static const String prefTips = 'prefTips';
  static const String prefTipsState = 'prefTipsState';
  static const String prefFaqs = 'prefFaqs';
  static const String prefFaqsState = 'prefFaqsState';
  static const String prefProtocols = 'prefProtocols';
  static const String prefProtocolsState = 'prefProtocolsState';

  //Do not disturb time
  static const String prefDoNotDisturbTimeStartHour = 'prefDoNotDisturbTimeStartHour';
  static const String prefDoNotDisturbTimeEndHour = 'prefDoNotDisturbTimeEndHour';
  static const String prefDoNotDisturbTimeStartMinutes = 'prefDoNotDisturbTimeStarMinutes';
  static const String prefDoNotDisturbTimeEndMinutes = 'prefDoNotDisturbTimeEndMinutes';

  //settings options
  static const String prefInfoUpdateNotifications = 'prefInfoUpdateNotifications';
  static const String prefClapsNotifications = 'prefClapsNotifications';
  static const String prefDailyUpdateNotifications = 'prefDailyUpdateNotifications';
  static const String prefDoNotDisturbTime = 'prefDoNotDisturbTime';

  //Connection Modes
  static const int ConnectionModeIntranet = 0;
  static const int ConnectionModeInternet = 1;
  static const int ConnectionModeMerge = 2;

  // Notifications ids
  static const int infoUpdateNotification = -1;
  static const int appUpdateNotification = -2;
  static const int clapsNotification = -3;

  static const int startClapsHour = 20;
  static const int startClapsMinute = 45;
  static const int stopClapsHour = 21;
  static const int stopClapsMinute = 2;

  static Time clapsTime = Time(20, 55, 00);

  static const int startSilentTime = 22;
  static const int endSilentTime = 9;

  static const String defaultPesquisador = """{
    "url": "http://autopesquisa.sld.cu/",
    "javascript": "document.querySelector('app-root').removeChild(document.querySelector('mat-toolbar'));",
    "contains": "autopesquisa.sld.cu"
  }""";

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
    'vcl': 'Villa Clara',
    'cfg': 'Cienfuegos',
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

  static const provincesCodes = <String, String>{
    '21': 'pri',
    '22': 'art',
    '23': 'lha',
    '24': 'may',
    '25': 'mat',
    '26': 'vcl',
    '27': 'cfg',
    '28': 'ssp',
    '29': 'cav',
    '30': 'cam',
    '31': 'ltu',
    '32': 'hol',
    '33': 'gra',
    '34': 'stg',
    '35': 'gtm',
    '40.01': 'ijv',
  };

  static const provincesAbbreviationsCodes = <String, String>{
    'pri': '21',
    'art': '22',
    'lha': '23',
    'may': '24',
    'mat': '25',
    'vcl': '26',
    'cfg': '27',
    'ssp': '28',
    'cav': '29',
    'cam': '30',
    'ltu': '31',
    'hol': '32',
    'gra': '33',
    'stg': '34',
    'gtm': '35',
    'ijv': '40.01',
  };

  static const municipalitiesNames = <String, String>{
    '21.01': 'Pinar del Río - Sandino',
    '21.02': 'Pinar del Río - Mantua',
    '21.03': 'Pinar del Río - Minas de Matahambre',
    '21.04': 'Pinar del Río - Viñales',
    '21.05': 'Pinar del Río - La Palma',
    '21.06': 'Pinar del Río - Los Palacios',
    '21.07': 'Pinar del Río - Consolación del Sur',
    '21.08': 'Pinar del Río - Pinar del Río',
    '21.09': 'Pinar del Río - San Luis',
    '21.10': 'Pinar del Río - San Juan y Martínez',
    '21.11': 'Pinar del Río - Guane',
    '22.01': 'Artemisa - Bahía Honda',
    '22.02': 'Artemisa - Mariel',
    '22.03': 'Artemisa - Guanajay',
    '22.04': 'Artemisa - Caimito',
    '22.05': 'Artemisa - Bauta',
    '22.06': 'Artemisa - San Antonio de los Baños',
    '22.07': 'Artemisa - Güira de Melena',
    '22.08': 'Artemisa - Alquízar',
    '22.09': 'Artemisa - Artemisa',
    '22.10': 'Artemisa - Candelaria',
    '22.11': 'Artemisa - San Cristóbal',
    '23.01': 'La Habana - Playa',
    '23.02': 'La Habana - Plaza de la Revolución',
    '23.03': 'La Habana - Centro Habana',
    '23.04': 'La Habana - La Habana Vieja',
    '23.05': 'La Habana - Regla',
    '23.06': 'La Habana - Habana del Este',
    '23.07': 'La Habana - Guanabacoa',
    '23.08': 'La Habana - San Miguel del Padrón',
    '23.09': 'La Habana - Diez de Octubre',
    '23.10': 'La Habana - Cerro',
    '23.11': 'La Habana - Marianao',
    '23.12': 'La Habana - La Lisa',
    '23.13': 'La Habana - Boyeros',
    '23.14': 'La Habana - Arroyo Naranjo',
    '23.15': 'La Habana - Cotorro',
    '24.01': 'Mayabeque - Bejucal',
    '24.02': 'Mayabeque - San José de las Lajas',
    '24.03': 'Mayabeque - Jaruco',
    '24.04': 'Mayabeque - Santa Cruz del Norte',
    '24.05': 'Mayabeque - Madruga',
    '24.06': 'Mayabeque - Nueva Paz',
    '24.07': 'Mayabeque - San Nicolás',
    '24.08': 'Mayabeque - Güines',
    '24.09': 'Mayabeque - Melena del Sur',
    '24.10': 'Mayabeque - Batabanó',
    '24.11': 'Mayabeque - Quivicán',
    '25.01': 'Matanzas - Matanzas',
    '25.02': 'Matanzas - Cárdenas',
    '25.03': 'Matanzas - Martí',
    '25.04': 'Matanzas - Colón',
    '25.05': 'Matanzas - Perico',
    '25.06': 'Matanzas - Jovellanos',
    '25.07': 'Matanzas - Pedro Betancourt',
    '25.08': 'Matanzas - Limonar',
    '25.09': 'Matanzas - Unión de Reyes',
    '25.10': 'Matanzas - Cienaga de Zapata',
    '25.11': 'Matanzas - Jagüey Grande',
    '25.12': 'Matanzas - Calimete',
    '25.13': 'Matanzas - Los Arabos',
    '26.01': 'Villa Clara - Corralillo',
    '26.02': 'Villa Clara - Quemado de Güines',
    '26.03': 'Villa Clara - Sagua La Grande',
    '26.04': 'Villa Clara - Encrucijada',
    '26.05': 'Villa Clara - Camajuaní',
    '26.06': 'Villa Clara - Caibarién',
    '26.07': 'Villa Clara - Remedios',
    '26.08': 'Villa Clara - Placetas',
    '26.09': 'Villa Clara - Santa Clara',
    '26.10': 'Villa Clara - Cifuentes',
    '26.11': 'Villa Clara - Santo Domingo',
    '26.12': 'Villa Clara - Ranchuelo',
    '26.13': 'Villa Clara - Manicaragua',
    '27.01': 'Cienfuegos - Aguada de Pasajeros',
    '27.02': 'Cienfuegos - Rodas',
    '27.03': 'Cienfuegos - Palmira',
    '27.04': 'Cienfuegos - Lajas',
    '27.05': 'Cienfuegos - Cruces',
    '27.06': 'Cienfuegos - Cumanayagua',
    '27.07': 'Cienfuegos - Cienfuegos',
    '27.08': 'Cienfuegos - Abreus',
    '28.01': 'Sancti Spíritus - Yaguajay',
    '28.02': 'Sancti Spíritus - Jatibonico',
    '28.03': 'Sancti Spíritus - Taguasco',
    '28.04': 'Sancti Spíritus - Cabaiguán',
    '28.05': 'Sancti Spíritus - Fomento',
    '28.06': 'Sancti Spíritus - Trinidad',
    '28.07': 'Sancti Spíritus - Sancti Spíritus',
    '28.08': 'Sancti Spíritus - La Sierpe',
    '29.01': 'Ciego de Ávila - Chambas',
    '29.02': 'Ciego de Ávila - Morón',
    '29.03': 'Ciego de Ávila - Bolivia',
    '29.04': 'Ciego de Ávila - Primero de Enero',
    '29.05': 'Ciego de Ávila - Ciro Redondo',
    '29.06': 'Ciego de Ávila - Florencia',
    '29.07': 'Ciego de Ávila - Majagua',
    '29.08': 'Ciego de Ávila - Ciego de Ávila',
    '29.09': 'Ciego de Ávila - Venezuela',
    '29.10': 'Ciego de Ávila - Baraguá',
    '30.01': 'Camagüey - Carlos Manuel de Céspedes',
    '30.02': 'Camagüey - Esmeralda',
    '30.03': 'Camagüey - Sierra de Cubitas',
    '30.04': 'Camagüey - Minas',
    '30.05': 'Camagüey - Nuevitas',
    '30.06': 'Camagüey - Guáimaro',
    '30.07': 'Camagüey - Sibanicú',
    '30.08': 'Camagüey - Camagüey',
    '30.09': 'Camagüey - Florida',
    '30.10': 'Camagüey - Vertientes',
    '30.11': 'Camagüey - Jimaguayú',
    '30.12': 'Camagüey - Najasa',
    '30.13': 'Camagüey - Santa Cruz del Sur',
    '31.01': 'Las Tunas - Manatí',
    '31.02': 'Las Tunas - Puerto Padre',
    '31.03': 'Las Tunas - Jesús Menéndez',
    '31.04': 'Las Tunas - Majibacoa',
    '31.05': 'Las Tunas - Las Tunas',
    '31.06': 'Las Tunas - Jobabo',
    '31.07': 'Las Tunas - Colombia',
    '31.08': 'Las Tunas - Amancio',
    '32.01': 'Holguín - Gibara',
    '32.02': 'Holguín - Rafael Freyre',
    '32.03': 'Holguín - Banes',
    '32.04': 'Holguín - Antilla',
    '32.05': 'Holguín - Báguanos',
    '32.06': 'Holguín - Holguín',
    '32.07': 'Holguín - Calixto García',
    '32.08': 'Holguín - Cacocum',
    '32.09': 'Holguín - Urbano Noris',
    '32.10': 'Holguín - Cueto',
    '32.11': 'Holguín - Mayarí',
    '32.12': 'Holguín - Frank País',
    '32.13': 'Holguín - Sagua de Tánamo',
    '32.14': 'Holguín - Moa',
    '33.01': 'Granma - Río Cauto',
    '33.02': 'Granma - Cauto Cristo',
    '33.03': 'Granma - Jiguaní',
    '33.04': 'Granma - Bayamo',
    '33.05': 'Granma - Yara',
    '33.06': 'Granma - Manzanillo',
    '33.07': 'Granma - Campechuela',
    '33.08': 'Granma - Media Luna',
    '33.09': 'Granma - Niquero',
    '33.10': 'Granma - Pilón',
    '33.11': 'Granma - Bartolomé Masó',
    '33.12': 'Granma - Buey Arriba',
    '33.13': 'Granma - Guisa',
    '34.01': 'Santiago de Cuba - Contramaestre',
    '34.02': 'Santiago de Cuba - Mella',
    '34.03': 'Santiago de Cuba - San Luis',
    '34.04': 'Santiago de Cuba - Segundo Frente',
    '34.05': 'Santiago de Cuba - Songo La Maya',
    '34.06': 'Santiago de Cuba - Santiago de Cuba',
    '34.07': 'Santiago de Cuba - Palma Soriano',
    '34.08': 'Santiago de Cuba - Tercer Frente',
    '34.09': 'Santiago de Cuba - Guamá',
    '35.01': 'Guantánamo - El Salvador',
    '35.02': 'Guantánamo - Manuel Tames',
    '35.03': 'Guantánamo - Yateras',
    '35.04': 'Guantánamo - Baracoa',
    '35.05': 'Guantánamo - Maisí',
    '35.06': 'Guantánamo - Imías',
    '35.07': 'Guantánamo - San Antonio del Sur',
    '35.08': 'Guantánamo - Caimanera',
    '35.09': 'Guantánamo - Guantánamo',
    '35.10': 'Guantánamo - Niceto Pérez',
    '40.01': 'Isla de la Juventud - Isla de la Juventud'
  };

  static const municipalitiesCodes = <String, String>{
    '21.01': 'Sandino',
    '21.02': 'Mantua',
    '21.03': 'Minas de Matahambre',
    '21.04': 'Viñales',
    '21.05': 'La Palma',
    '21.06': 'Los Palacios',
    '21.07': 'Consolación del Sur',
    '21.08': 'Pinar del Río',
    '21.09': 'San Luis',
    '21.10': 'San Juan y Martínez',
    '21.11': 'Guane',
    '22.01': 'Bahía Honda',
    '22.02': 'Mariel',
    '22.03': 'Guanajay',
    '22.04': 'Caimito',
    '22.05': 'Bauta',
    '22.06': 'San Antonio de los Baños',
    '22.07': 'Güira de Melena',
    '22.08': 'Alquízar',
    '22.09': 'Artemisa',
    '22.10': 'Candelaria',
    '22.11': 'San Cristóbal',
    '23.01': 'Playa',
    '23.02': 'Plaza de la Revolución',
    '23.03': 'Centro Habana',
    '23.04': 'La Habana Vieja',
    '23.05': 'Regla',
    '23.06': 'Habana del Este',
    '23.07': 'Guanabacoa',
    '23.08': 'San Miguel del Padrón',
    '23.09': 'Diez de Octubre',
    '23.10': 'Cerro',
    '23.11': 'Marianao',
    '23.12': 'La Lisa',
    '23.13': 'Boyeros',
    '23.14': 'Arroyo Naranjo',
    '23.15': 'Cotorro',
    '24.01': 'Bejucal',
    '24.02': 'San José de las Lajas',
    '24.03': 'Jaruco',
    '24.04': 'Santa Cruz del Norte',
    '24.05': 'Madruga',
    '24.06': 'Nueva Paz',
    '24.07': 'San Nicolás',
    '24.08': 'Güines',
    '24.09': 'Melena del Sur',
    '24.10': 'Batabanó',
    '24.11': 'Quivicán',
    '25.01': 'Matanzas',
    '25.02': 'Cárdenas',
    '25.03': 'Martí',
    '25.04': 'Colón',
    '25.05': 'Perico',
    '25.06': 'Jovellanos',
    '25.07': 'Pedro Betancourt',
    '25.08': 'Limonar',
    '25.09': 'Unión de Reyes',
    '25.10': 'Cienaga de Zapata',
    '25.11': 'Jagüey Grande',
    '25.12': 'Calimete',
    '25.13': 'Los Arabos',
    '26.01': 'Corralillo',
    '26.02': 'Quemado de Güines',
    '26.03': 'Sagua La Grande',
    '26.04': 'Encrucijada',
    '26.05': 'Camajuaní',
    '26.06': 'Caibarién',
    '26.07': 'Remedios',
    '26.08': 'Placetas',
    '26.09': 'Santa Clara',
    '26.10': 'Cifuentes',
    '26.11': 'Santo Domingo',
    '26.12': 'Ranchuelo',
    '26.13': 'Manicaragua',
    '27.01': 'Aguada de Pasajeros',
    '27.02': 'Rodas',
    '27.03': 'Palmira',
    '27.04': 'Lajas',
    '27.05': 'Cruces',
    '27.06': 'Cumanayagua',
    '27.07': 'Cienfuegos',
    '27.08': 'Abreus',
    '28.01': 'Yaguajay',
    '28.02': 'Jatibonico',
    '28.03': 'Taguasco',
    '28.04': 'Cabaiguán',
    '28.05': 'Fomento',
    '28.06': 'Trinidad',
    '28.07': 'Sancti Spíritus',
    '28.08': 'La Sierpe',
    '29.01': 'Chambas',
    '29.02': 'Morón',
    '29.03': 'Bolivia',
    '29.04': 'Primero de Enero',
    '29.05': 'Ciro Redondo',
    '29.06': 'Florencia',
    '29.07': 'Majagua',
    '29.08': 'Ciego de Ávila',
    '29.09': 'Venezuela',
    '29.10': 'Baraguá',
    '30.01': 'Carlos Manuel de Céspedes',
    '30.02': 'Esmeralda',
    '30.03': 'Sierra de Cubitas',
    '30.04': 'Minas',
    '30.05': 'Nuevitas',
    '30.06': 'Guáimaro',
    '30.07': 'Sibanicú',
    '30.08': 'Camagüey',
    '30.09': 'Florida',
    '30.10': 'Vertientes',
    '30.11': 'Jimaguayú',
    '30.12': 'Najasa',
    '30.13': 'Santa Cruz del Sur',
    '31.01': 'Manatí',
    '31.02': 'Puerto Padre',
    '31.03': 'Jesús Menéndez',
    '31.04': 'Majibacoa',
    '31.05': 'Las Tunas',
    '31.06': 'Jobabo',
    '31.07': 'Colombia',
    '31.08': 'Amancio',
    '32.01': 'Gibara',
    '32.02': 'Rafael Freyre',
    '32.03': 'Banes',
    '32.04': 'Antilla',
    '32.05': 'Báguanos',
    '32.06': 'Holguín',
    '32.07': 'Calixto García',
    '32.08': 'Cacocum',
    '32.09': 'Urbano Noris',
    '32.10': 'Cueto',
    '32.11': 'Mayarí',
    '32.12': 'Frank País',
    '32.13': 'Sagua de Tánamo',
    '32.14': 'Moa',
    '33.01': 'Río Cauto',
    '33.02': 'Cauto Cristo',
    '33.03': 'Jiguaní',
    '33.04': 'Bayamo',
    '33.05': 'Yara',
    '33.06': 'Manzanillo',
    '33.07': 'Campechuela',
    '33.08': 'Media Luna',
    '33.09': 'Niquero',
    '33.10': 'Pilón',
    '33.11': 'Bartolomé Masó',
    '33.12': 'Buey Arriba',
    '33.13': 'Guisa',
    '34.01': 'Contramaestre',
    '34.02': 'Mella',
    '34.03': 'San Luis',
    '34.04': 'Segundo Frente',
    '34.05': 'Songo La Maya',
    '34.06': 'Santiago de Cuba',
    '34.07': 'Palma Soriano',
    '34.08': 'Tercer Frente',
    '34.09': 'Guamá',
    '35.01': 'El Salvador',
    '35.02': 'Manuel Tames',
    '35.03': 'Yateras',
    '35.04': 'Baracoa',
    '35.05': 'Maisí',
    '35.06': 'Imías',
    '35.07': 'San Antonio del Sur',
    '35.08': 'Caimanera',
    '35.09': 'Guantánamo',
    '35.10': 'Niceto Pérez',
    '40.01': 'Isla de la Juventud'
  };

  static const tips = <List<String>>[
    [
      'Puede reducir el riesgo de infección:',
      '- Lavándose las manos regularmente con agua y jabón o con '
          'desinfectante de manos a base de alcohol.\n\n'
          '- Cubriéndose la nariz y la boca al toser y estornudar con un '
          'pañuelo de papel desechable o con la parte interna del codo.\n\n'
          '- Evitando el contacto directo (1 metro o 3 pies) con cualquier '
          'persona con síntomas de resfriado o gripe (influenza).'
    ],
    [
      'Los signos y síntomas pueden ser:',
      '- Dolor de garganta\n\n'
          '- Tos\n\n'
          '- Fiebre\n\n'
          '- Dificultad para respirar (en casos graves)'
    ],
    [
      'La COVID-19 se caracteriza por:',
      'Síntomas leves, como, dolor de garganta, tos y fiebre. La '
          'enfermedad puede ser más grave en algunas personas '
          'y provocar neumonía o dificultades respiratorias. Más raramente '
          'puede ser mortal. Las personas de edad avanzada y las personas con '
          'otras afecciones médicas (como asma, diabetes o cardiopatías) pueden '
          'ser más vulnerables y enfermar de gravedad.'
    ],
    [
      'El nuevo coronavirus se propaga principalmente por:',
      'Contacto directo (1 metro o 3 pies) con una persona infectada '
          'cuando tose o estornuda, o por contacto con sus gotículas '
          'respiratorias (saliva o secreciones nasales).'
    ],
    [
      'Cómo ponerse, usar, quitarse y desechar una mascarilla:',
      '- Antes de ponerse una mascarilla, lávese las manos con un '
          'desinfectante a base de alcohol o con agua y jabón.\n\n'
          '- Cúbrase la boca y la nariz con la mascarilla y asegúrese de que '
          'no haya espacios entre su cara y la máscara.\n\n'
          '- Evite tocar la mascarilla mientras la usa; si lo hace, lávese '
          'las manos con un desinfectante a base de alcohol o con agua y '
          'jabón.\n\n'
          '- Cámbiese de mascarilla tan pronto como esté húmeda y no reutilice '
          'las mascarillas de un solo uso.\n\n'
          '- Para quitarse la mascarilla: quítesela por detrás (no toque la '
          'parte delantera de la mascarilla), deséchela inmediatamente en un '
          'recipiente cerrado, y lávese las manos con un desinfectante a base '
          'de alcohol o con agua y jabón.'
    ],
    [
      '¿Qué es un coronavirus?',
      'Los coronavirus son una extensa familia de virus que pueden causar '
          'enfermedades tanto en animales como en humanos. En los humanos, se '
          'sabe que varios coronavirus causan infecciones respiratorias que '
          'pueden ir desde el resfriado común hasta enfermedades más graves '
          'como el síndrome respiratorio de Oriente Medio (MERS) y el síndrome '
          'respiratorio agudo severo (SRAS). El coronavirus que se ha '
          'descubierto más recientemente causa la enfermedad por coronavirus '
          'COVID-19.'
    ],
    [
      '¿Qué es la COVID-19?',
      'La COVID-19 es la enfermedad infecciosa causada por el coronavirus '
          'que se ha descubierto más recientemente. Tanto el nuevo virus como '
          'la enfermedad eran desconocidos antes de que estallara el brote en '
          'Wuhan (China) en diciembre de 2019.'
    ],
    [
      '¿Es posible contagiarse de COVID-19 por contacto con una persona que '
          'no presente ningún síntoma?',
      'La principal forma de propagación de la enfermedad es a través de '
          'las gotículas respiratorias expelidas por alguien al toser. Muchas '
          'personas que contraen la COVID-19 solo presentan síntomas leves. '
          'Esto es particularmente cierto en las primeras etapas de la '
          'enfermedad. Por lo tanto, es posible contagiarse de alguien que, '
          'por ejemplo, solamente tenga una tos leve y no se sienta enfermo.'
    ],
    [
      'Evite tocarse los ojos, la nariz y la boca. ¿Por qué?',
      'Las manos tocan muchas superficies y pueden recoger '
          'virus. Una vez contaminadas, las manos pueden transferir el virus '
          'a los ojos, la nariz o la boca. Desde allí, el virus puede entrar '
          'en su cuerpo y causarle la enfermedad.'
    ],
    [
      '¿Debo preocuparme por la COVID-19?',
      'Por lo general, los síntomas de la COVID-19 son leves, sobre todo '
          'en los niños y los adultos jóvenes. No obstante, también pueden ser '
          'graves y obligan a hospitalizar a alrededor de uno de cada cinco '
          'infectados. Por consiguiente, es bastante normal preocuparse por '
          'los efectos que el brote de COVID-19 puede tener en nosotros y en '
          'nuestros seres queridos.'
    ],
    [
      '¿Cuánto dura el periodo de incubación de la COVID-19?',
      'El «período de incubación» es el tiempo que transcurre entre la '
          'infección por el virus y la aparición de los síntomas de la '
          'enfermedad. La mayoría de las estimaciones respecto al periodo '
          'de incubación de la COVID-19 oscilan entre 1 y 14 días, y en '
          'general se sitúan en torno a cinco días. Estas estimaciones se '
          'irán actualizando a medida que se tengan más datos.'
    ],
    [
      '¿Mi mascota me puede contagiar la COVID-19?',
      'Se han notificado casos en una pequeña cantidad de animales en el mundo infectados por el virus que causa la COVID-19, en su mayoría después de haber tenido contacto con una persona con COVID-19. Con base a la información limitada disponible hasta la fecha, el riesgo de que los animales transmitan la COVID-19 a las personas se considera bajo. Al parecer el virus que causa la COVID-19 puede propagarse de personas a animales en ciertas situaciones por lo que debe tratar a las mascotas como a otros familiares humanos, no deje que interactúen con personas o animales fuera del hogar. No permita que las mascotas interactúen con otras personas ni animales fuera del hogar. Mantenga a sus gatos dentro de la casa siempre que sea posible, para evitar que interactúen con otros animales o personas. Pasee a sus perros con correa, manteniendo una distancia de al menos 6 pies (2 metros) de otras personas y animales. Evite los parques para perros o los espacios públicos donde se reúnen grandes cantidades de personas y perros. Lávese las manos luego de estar con animales y manipular su comida, desechos o suministros. Practique buenos hábitos de higiene con su mascota y limpie sus desechos adecuadamente. Esta es una situación que cambia rápidamente y la información se actualizará a medida que esté disponible.'
    ],
    [
      '¿Cuánto tiempo sobrevive el virus en una superficie?',
      'No se sabe con certeza cuánto tiempo sobrevive el virus causante de '
          'la COVID-19 en una superficie, pero parece comportarse como otros '
          'coronavirus. Los estudios realizados (incluida la información '
          'preliminar disponible sobre el virus de la COVID-19) indican que '
          'los coronavirus pueden subsistir en una superficie desde unas pocas '
          'horas hasta varios días. El tiempo puede variar en función de las '
          'condiciones (por ejemplo, el tipo de superficie, la temperatura o '
          'la humedad del ambiente). Si cree que una superficie puede estar '
          'infectada, límpiela con un desinfectante común para matar el virus '
          'y protegerse de este modo a usted mismo y a los demás. Lávese las '
          'manos con un desinfectante a base de alcohol o con agua y jabón. '
          'Evite tocarse los ojos, la boca o la nariz.'
    ],
    [
      '¿El virus que provoca la COVID-19 puede transmitirse en zonas con climas cálidos y '
          'húmedos?',
      'Las pruebas científicas obtenidas hasta ahora indican que el virus '
          'de la COVID-19 puede transmitirse en CUALQUIER ZONA, incluidas las '
          'de clima cálido y húmedo. Con independencia de las condiciones '
          'climáticas, hay que adoptar medidas de protección si se vive en una '
          'zona donde se hayan notificado casos de COVID-19 o si se viaja a '
          'ella. La mejor manera de protegerse contra la COVID-19 es lavarse '
          'las manos con frecuencia. De esta manera se eliminan los virus que '
          'puedan estar en las manos y se evita la infección que podría '
          'producirse al tocarse los ojos, la boca y la nariz.'
    ],
    [
      '¿El nuevo coronavirus NO PUEDE transmitirse a través de picaduras de '
          'mosquitos?',
      'El nuevo coronavirus es un virus respiratorio que se propaga '
          'principalmente por contacto con una persona infectada a través de '
          'las gotículas respiratorias que se generan cuando esta persona tose '
          'o estornuda, por ejemplo, o a través de gotículas de saliva o '
          'secreciones de la nariz. Hasta la fecha no hay información ni '
          'pruebas que indiquen que el 2019-nCoV pueda transmitirse por medio '
          'de mosquitos. Para protegerse, evite el contacto cercano con '
          'cualquier persona que tenga fiebre y tos, y practique una buena '
          'higiene de las manos y de las vías respiratorias.'
    ],
    [
      'El nuevo coronavirus, ¿Afecta solo a las personas de edad o también '
          'puede afectar a las más jóvenes?',
      'El nuevo coronavirus (2019-nCoV) puede infectar a personas de '
          'todas las edades, si bien se ha observado que las personas mayores '
          'y las que padecen algunas enfermedades (como el asma, la diabetes '
          'o las cardiopatías) tienen más probabilidades de enfermarse '
          'gravemente cuando adquieren la infección. La OMS aconseja a las '
          'personas de todas las edades que tomen medidas para protegerse del '
          'virus, por ejemplo, mediante una buena higiene de manos y '
          'respiratoria.'
    ]
  ];

  static List<List<String>> faqs = <List<String>>[
    [
      '¿Si presento problemas con la aplicación qué debería hacer?',
      'Primero le aconsejamos que lea esta sección de la aplicación, y si '
          'su interrogante sigue sin ser respondida, le invitamos a que '
          'entre a nuestro canal y grupo de Telegram '
          'https://t.me/covid19cubadata y https://t.me/covid19cubadatachat '
          'respectivamente, para que nuestro equipo le de respuesta a sus '
          'interrogantes.',
    ],
    [
      '¿Por qué si recién terminó el parte del Minsap no se han actualizado '
          'los datos? ¿Cuándo se hará?',
      'Todos nuestros datos son tomados a partir de los partes del Minsap '
          'por lo que, tras terminar la conferencia nuestro equipo de '
          'periodistas se toma la tarea de transcribir cada uno de los '
          'casos que surgieron en el día. Una vez terminado este proceso '
          'y se actualicen los datos tenemos un sistema de notificaciones '
          'que le alertará de algún cambio en la información. Por ahora '
          'presentamos dos fuentes de notificaciones, la primera nuestro '
          'bot de Telegram y la segunda esta aplicación (requiere tener '
          'instalada una versión superior a la v0.5.0 y tener un '
          'paquete de datos activo).',
    ],
    [
      'La fecha de los datos que aparece en la aplicación tiene un día de '
          'atraso. ¿Significa esto qué no se han actualizado los datos?',
      'No, los partes que se realizan diariamente por el Minsap contienen '
          'los casos registrados hasta las 11:59 pm de la noche anterior. '
          'Por lo que la información que se considera actualizada con '
          'respecto al parte tiene un día de atraso.'
    ],
    [
      '¿Es posible emplear la aplicación de conjunto con la bolsa nauta?',
      'No, desgraciadamente no está dentro de las posibilidades de nuestro '
          'equipo de que sea accedible la aplicación por la bolsa nauta. '
          'Por lo que necesita estar conectado ya sea por wifi o por datos '
          'para poder consultar nuestra información.',
    ],
    [
      '¿La aplicación consume datos nacionales?',
      'Si, aunque es posible seleccionar de cual fuente de datos prefiere '
          'obtener su información. Si prefiere que consuma primero de '
          'fuentes nacionales y si, estas fallan consulta en internet '
          '(opción por defecto). Todas estas variantes son configurables y '
          'las puede encontrar en su menú lateral en el apartado de '
          'Configuración.',
    ],
    [
      '¿Es posible emplear los datos de los que dispone la aplicación?',
      'Si, es posible emplear los datos que disponemos. Los tenemos '
          'disponibles tanto en formato JSON como CSV. Para más información '
          'consulte nuestro sitios web https://covid19cubadata.github.io o '
          'https://www.cusobu.nat.cu/covid.',
    ],
    [
      '¿Es posible acceder a la vista del Pesquisador Virtual o la de la'
          'Tabla de Casos sin conexión?',
      'No, no es posible acceder la vista del Pesquisador Virtual ni a '
          'la vista de la Tabla de Casos sin conexión.\n\n'
          'Para porder acceder a la vista del Pesquisador Virtual es '
          'necesario tener algun tipo de conexión en el teléfono, ya '
          'sea datos, wifi o nauta hogar. En el caso de la Tabla de Casos '
          'es necesario estar autenticado en nauta hogar, wifi Etecsa, '
          'tener algun paquete de datos, acceso a internet o a la red '
          'nacional cubana.',
    ],
    [
      '¿Es posible acceder a la vista del Pesquisador Virtual desde fuera '
          'de Cuba?',
      'No, esta funcionalidad es exclusiva para Cuba. No es posible acceder '
          'desde fuera del territorio nacional cubano. Si se encuentra en '
          'suelo cubano y no puede acceder, le recomendamos que revise sus '
          'configuraciones de conexión.\n\n'
          'Esta funcionalidad solo esta disponible si, además de estar en '
          'Cuba, obtiene nuestras informaciones de algún servidor nacional. '
          '(1ra o 3ra opción de configuración).',
    ],
  ];

  static List<Map<String, String>> collaborators = <Map<String, String>>[
    {
      'name': 'Jorge Alberto Reyes Carballeira',
      'description':
          'Ing. en Telecomunicaciones y Electrónica, graduado de la CUJAE. '
              'Programador aficionado.',
      'link': 'https://github.com/georkings',
    },
    {
      'name': 'Daniel Alejandro Cárdenas Cabrera',
      'description':
          'Estudiante de Ciencia de la Computación en la Univ. de La Habana. '
              'Integrante del grupo de Inteligencia Artificial de la Facultad de '
              'Matemática y Computación.',
      'link': 'https://github.com/DanielUH2019',
    },
    {
      'name': 'Luis Eduardo González',
      'description':
          'Ing. en Ciencias Informáticas. Graduado en la Universidad de '
              'Ciencias Informáticas. Desarrollador de Software.',
      'link': 'https://github.com/luiseduardoglez',
    },
    {
      'name': 'Ernesto Avila Domenech',
      'description':
          'Ing. en Ciencias Informáticas. Máster en Informática Aplicada en '
              'la Univ. de Camagüey. Profesor Asistente en la Universidad de '
              'Granma.',
      'link': 'https://github.com/eadomenech',
    },
    {
      'name': 'Saimi Reyes',
      'description':
          'Lic. en Periodismo, graduada de la Univ. de La Habana. Editora y '
              'Periodista de Postdata.club.',
      'link': '',
    },
    {
      'name': 'Claudia Alemañy',
      'description':
          'Lic. en Periodismo, graduada de la Univ. de La Habana. Periodista '
              'de Juventud Técnica.',
      'link': '',
    },
    {
      'name': 'Dariagna Steyners',
      'description':
          'Diseñadora, graduada del Instituto Superior de Diseño de la Univ. de '
              'La Habana. Diseñadora de Juventud Técnica.',
      'link': '',
    },
    {
      'name': 'Iramis Alonso',
      'description':
          'Lic. en Periodismo, graduada de la Univ. de La Habana. Directora y '
              'Periodista de Juventud Técnica.',
      'link': '',
    },
    {
      'name': 'Ernesto Guerra',
      'description':
          'Lic. en Periodismo, graduado de la Univ. de La Habana. Periodista '
              'de Postdata.club y Juventud Técnica.',
      'link': '',
    },
    {
      'name': 'Norlan Capote Díaz',
      'description':
          'Ing. en Ciencias Informáticas, graduado de la Univ. de las Ciencias '
              'Informáticas. Scrum Máster.'
              ' Analista y desarrollador senior de sistemas.',
      'link': 'https://www.linkedin.com/in/norlancd',
    },
    {
      'name': 'Sandy F. Pérez Matamoros',
      'description':
          'Ing. en Ciencias Informáticas, graduado de la Univ. de las Ciencias '
              'Informáticas. Cofundador de CUSOBU.',
      'link': 'https://www.linkedin.com/in/sandy-p%C3%A9rez-25a00585',
    },
    {
      'name': 'Gabriel Alejandro López López',
      'description':
          'Ing. Informático, graduado de la Univ. de Cienfuegos. MSc. '
              'Administracion de negocios. CEO y fundador de Daxslab.',
      'link': 'https://www.linkedin.com/in/glpzzz/',
    },
    {
      'name': 'Carlos César Caballero',
      'description':
          'Ing. en Ciencias Informáticas, graduado de la Univ. de las Ciencias '
              'Informáticas. CTO y fundador de Daxslab.',
      'link':
          'https://www.linkedin.com/in/carlos-cesar-caballero-d%C3%ADaz-a76b24103',
    },
    {
      'name': 'Maikel Llamaret Heredia',
      'description':
          'Lic. Bioquímica, graduado de la Univ. de La Habana. Estudiante de '
              'Ingeniería Informática en la Univ. de Oriente.'
              'Fundador del Proyecto SWL-X.',
      'link': 'mailto:llamaret@webmisolutions.com',
    },
    {
      'name': 'Frank Sadan Naranjo Noda',
      'description':
          'Lic. Matemática, graduado de la Univ. de La Habana. Investigador del '
              'departamento de Matemática Interdisciplinaria del Instituto de '
              'Cibernética, Matemática y Física. Integrante del grupo de IA de '
              'la Univ. de La Habana.',
      'link': 'mailto:fsadannn@gmail.com',
    },
    {
      'name': 'Hian Cañizares Díaz',
      'description':
          'Lic. Ciencia de la Computación, graduado de la Univ. de La Habana. '
              'Profesor de la Fac. Matemática y Computación de la Univ. de '
              'La Habana. Integrante del grupo de IA de la Univ. de La Habana.',
      'link': 'mailto:hiancdtrsnm@gmail.com',
    },
    {
      'name': 'Yudivián Almeida',
      'description':
          'Lic. Ciencia de la Computación, Dr. Ciencias Matemáticas, Profesor de '
              'la Fac. Matemática y Computación de la Univ. de La Habana, Editor '
              'de Datos de Postdata.club',
      'link': '',
    },
    {
      'name': 'Luis Correa Leyva',
      'description':
          'Estudiante de Ciencia de la Computación en la Univ. de Oriente.',
      'link': 'https://correaleyval.github.io',
    },
    {
      'name': 'Carlos Bermudez Porto',
      'description':
          'Estudiante de Ciencia de la Computación en la Univ. de La Habana. '
              'Alumno Ayudante de Programación.',
      'link': 'https://www.linkedin.com/in/carlos-bermudez-porto-3078bb165',
    },
    {
      'name': 'Roberto Marti Cedeño',
      'description':
          'Estudiante de Ciencia de la Computación en la Univ. de La Habana.',
      'link': 'mailto:roberto.marti@iris.uh.cu',
    },
    {
      'name': 'Leynier Gutiérrez González',
      'description':
          'Estudiante de Ciencia de la Computación en la Univ. de La Habana. '
              'Alumno Ayudante de Programación y Redes de Computadoras. '
              'Desarrollador Full Stack.',
      'link': 'https://leynier.github.io',
    },
  ];

  static List<Map<String, String>> replicas = <Map<String, String>>[
    {
      'text': 'CUSOBU',
      'url': 'https://www.cusobu.nat.cu/covid',
      'replicaUrl': 'https://www.cusobu.nat.cu',
    },
    {
      'text': 'Federación de Radioaficionados de Cuba',
      'url': 'http://covid19.frcuba.cu',
      'replicaUrl': 'https://www.frcuba.cu',
    },
    {
      'text': 'Proyecto SWL-X',
      'url': 'http://covidcuba.swlx.info',
      'replicaUrl': 'https://www.swlx.info',
    },
    {
      'text': 'Universidad de La Habana',
      'url': 'https://covid19cubadata.uh.cu',
      'replicaUrl': 'http://www.uh.cu',
    },
    /*{
      'text':'Joven Club',
      'url':'http://covid19.jovenclub.cu',
      'replicaUrl':'https://www.jovenclub.cu',
    },*/
  ];

  static String thanks =
      'El equipo de desarrollo de Covid19 Cuba Data agradece a todos '
      'los que de una forma u otra ayudan a combatir la pandemia de la '
      'Covid-19, en especial a los que arriesgan su vida luchando en '
      'primera línea.';

  static List<Map<String, String>> promotors = <Map<String, String>>[
    {
      'name': 'MatCom',
      'url': 'http://www.matcom.uh.cu',
    },
    {
      'name': 'Postdata.club',
      'url': 'https://www.postdata.club',
    },
    {
      'name': 'Juventud Técnica',
      'url': 'https://medium.com/juventud-técnica',
    },
  ];

  static List<Map<String, String>> collabProjects = <Map<String, String>>[
    {
      'name': 'CUSOBU',
      'url': 'https://www.cusobu.nat.cu',
    },
    {
      'name': 'Proyecto SWL-X',
      'url': 'https://www.swlx.info',
    },
    {
      'name': 'Daxslab',
      'url': 'https://www.daxslab.com',
    },
    {
      'name': 'Unión de Informáticos de Cuba',
      'url': 'https://www.uic.cu',
    },
    {
      'name': 'Universidad de Oriente',
      'url': 'https://www.uo.edu.cu',
    },
    {
      'name': 'Universidad de La Habana',
      'url': 'http://www.uh.cu',
    },
  ];
}
