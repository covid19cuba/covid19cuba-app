// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  static const divider = const Divider(
    thickness: 1,
    indent: 16,
    endIndent: 16,
  );

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
          'Modo de conexión',
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
        divider,
        SwitchPreference(
          'Zoom en las gráficas',
          Constants.prefChartsZoom,
          desc: 'Permite hacer zoom en las gráficas. '
              'Puede que necesite de mayor consumo de recursos '
              'de su teléfono.',
        ),
        divider,
        ListTile(
          title: Text('Configurar Proxy'),
          trailing: Icon(Icons.arrow_right),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProxyPage(),
            ),
          ),
        ),
        divider,
        ListTile(
          title: Text('Notificaciones'),
          trailing: Icon(Icons.arrow_right),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationSettings(),
            ),
          ),
        ),
        divider,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: GFButton(
            text: 'Reiniciar estado de la Aplicación',
            textColor: Constants.primaryColor,
            textStyle: TextStyle(
              color: Constants.primaryColor,
            ),
            color: Constants.primaryColor,
            shape: GFButtonShape.pills,
            type: GFButtonType.outline2x,
            borderSide: BorderSide(width: 1.0, color: Constants.primaryColor),
            fullWidthButton: true,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirme'),
                    content: Text(
                      'Usted esta seguro o segura que desea '
                      'reiniciar el estado de la aplicación.\n\n'
                      'Esto hará que vuelva al estado de acabada de '
                      'instalar.',
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Si'),
                        onPressed: () {
                          PrefService.clear();
                          exit(0);
                        },
                      ),
                      FlatButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
