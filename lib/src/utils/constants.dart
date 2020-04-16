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

  static const faqs = <List<String>>[
    [
      'Presento un problema con la aplicación que debería hacer ?',
      'Primero le aconsejamos que lea esta sección de la aplicación y si, su interrogante sigue sin aparecer, '
          'le invitamos a que entre a nuestro canal y grupo de soporte https://t.me/covid19cubadata y https://t.me/covid19cubadatachat '
          'respectivamente, para que nuestro equipo le de respuesta a sus preocupaciones.',
    ],
    [
      'Recién se terminó el parte del MINSAP y no se han actualizado los datos. Cuando se hará ?',
      'Todos nuestros datos son tomados a partir de las partes del Minsap por lo que, tras terminar la conferencia '
          'nuestro aguerrido equipo de periodistas se toma la tarea de transcribir cada uno de los casos que surgieron en el día. '
          'Una vez terminado este proceso y se actualicen los datos tenemos un sistema de notificaciones que le alertarán de algún '
          'cambio en la información. Por ahora presentamos dos fuentes de notificaciones, la primera nuestro bot (asistente virtual) '
          'presente en Telegram y la segunda esta aplicación (requiere tener instalada una versión superior a la v0.5.0 y tener un '
          'paquete de datos activo).',
    ],
    [
      'La fecha de los datos que aparece en la aplicación tiene un día de atraso. Significa esto que no se han actualizado los datos?',
      'No, los partes que se realizan diariamente por el Minsap contienen los casos registrados hasta las 11:59 pm de la noche anterior. '
          'Por lo que la información que se considera actualizadacon respecto al parte tiene un día de atraso.'
    ],
    [
      'Es posible emplear la aplicación de conjunto con la bolsa nauta ?',
      'No, desgraciadamente no se dentro de las posibilidades de nuestro equipo de que sea accedible la aplicación por la bolsa nauta. '
          'Por lo que necesita estar conectado ya sea por wifi o por datos para poder consultar nuestra información.',
    ],
    [
      'La aplicación consume datos nacionales ?',
      'Si, aunque es posible seleccionar de cual fuente de datos prefiere obtener su información. Si prefiere que consuma primero de '
          'fuentes nacionales y si, estas fallan consulta en internet (opción por defecto). Todas estas variantes son configurables y '
          'las puede encontrar en su menú lateral en el apartado de opciones.',
    ],
    [
      'Es posible emplear los datos de los que disponen ?',
      'Si, es posible emplear los datos que disponemos. Los tenemos disponibles tanto en formato JSON como CSV. para más información '
          'consulte nuestro links https://covid19cubadata.github.io/ o https://www.cusobu.nat.cu/covid/',
    ]
  ];
}
