import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Configuración'),
        centerTitle: true,
      ),
      body: PreferencePage([
        /*PreferenceTitle(
          'Intervalo de actualización:',
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        DropdownPreference(
          'Intervalo',
          Constants.prefSetUpTasksMinutes,
          defaultVal: Constants.setUpTasksMinutesDefault,
          values: [15, 30, 60],
           displayValues: ["15 minutos", "30 minutos", "1 hora"],
        ),*/
        PreferenceTitle(
          'Modo de conexión:',
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        RadioPreference<int>(
          'Conectarse a un servidor ubicado en Cuba',
          Constants.ConnectionModeIntranet,
          Constants.prefConnectionMode,
          desc: 'Menor velocidad y estabilidad de conexión. '
              'Bueno para los usuarios de Cuba que quieran ahorrar.',
        ),
        RadioPreference<int>(
          'Conectarse a un servidor fuera de Cuba',
          Constants.ConnectionModeInternet,
          Constants.prefConnectionMode,
          desc: 'Mayor velocidad y estabilidad de conexión. '
              'Bueno para los usuarios que estén fuera de Cuba o aquellos '
              'que prefieran la calidad de la conexión.',
        ),
        RadioPreference<int>(
          'Conectarse a un servidor ubicado en Cuba y si da error a uno externo',
          Constants.ConnectionModeMerge,
          Constants.prefConnectionMode,
          desc: 'Opción recomendada para los usuarios de Cuba. Permite '
              'ahorrar y a la vez tener una estabilidad del servicio buena.',
          isDefault: true,
        ),
      ]),
    );
  }
}
