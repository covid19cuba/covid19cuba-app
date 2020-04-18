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
  static const String prefFirstModificationNotification =
      'firstModificationNotification';

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
