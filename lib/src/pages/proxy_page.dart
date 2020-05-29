// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class ProxyPage extends StatelessWidget {
  static const divider = const Divider(
    thickness: 1,
    indent: 16,
    endIndent: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Proxy HTTP'),
        centerTitle: true,
      ),
      body: PreferencePage([
        PreferenceTitle(
          'Servidor Proxy',
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SwitchPreference(
          'Activar Servidor Proxy',
          Constants.prefProxy,
          desc: 'Obtener los datos a través de un servidor proxy',
        ),
        TextFieldPreference(
          'Dirección Web', Constants.prefProxyHost,
          defaultVal: '',
          validator: (String str) {
            if (str.contains(' ')) {
              return "Dirección Inválida";
            }
            return null;
          },
        ),
        TextFieldPreference(
          'Puerto',
          Constants.prefProxyPort,
          defaultVal: '',
          validator: (str) {
            try{
              var value = int.parse(str);
              if(value <= 0){
                return "Puerto incorrecto";
              }
            }
            catch (e) {
              return "Puerto incorrecto";
            }
            return null;
          },
        ),
        divider,
        SwitchPreference(
          'Credenciales',
          Constants.prefProxyCredentials,
          desc: 'Credenciales para emplear el servidor proxy',
        ),
        TextFieldPreference(
          'Nombre de Usuario', Constants.prefProxyCredentialsName,
          defaultVal: '',
        ),
        TextFieldPreference(
          'Contraseña',
          Constants.prefProxyCredentialsPassword,
          defaultVal: '',
          obscureText: true,
        ),
        divider,
        PreferenceText(
          'Configuración avanzada',
          style: TextStyle(color: Colors.red),
        ),
        SwitchPreference(
          'Aceptar certificados de seguridad inseguros',
          Constants.prefProxyAllowInsecureCertificates,
          desc: 'Aceptar cualquier certificado de seguridad que sea devuelto al conectarse al proxy. '
              'Esta opción no tiene efecto si la conexión necesita el empleo de credenciales',
        ),
        divider,
      ]),
    );
  }
}
