// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class ProxyPage extends StatefulWidget {
  @override
  State<ProxyPage> createState() => ProxyPageState();
}

class ProxyPageState extends State<ProxyPage> {
  bool proxyEnabled;
  bool credentialsEnabled;

  static const divider = const Divider(
    thickness: 1,
    indent: 16,
    endIndent: 16,
  );

  ProxyPageState() {
    this.proxyEnabled = PrefService.getBool(Constants.prefProxy) ?? false;
    this.credentialsEnabled =
        PrefService.getBool(Constants.prefProxyCredentials) ?? false;
  }

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
          onChange: updateProxySettings,
        ),
        TextFieldPreference(
          'Dirección Web',
          Constants.prefProxyHost,
          defaultVal: '',
          disabled: !this.proxyEnabled,
          validator: proxyUrlValidator,
        ),
        TextFieldPreference(
          'Puerto',
          Constants.prefProxyPort,
          defaultVal: '',
          disabled: !this.proxyEnabled,
          validator: proxyPortValidator,
        ),
        divider,
        SwitchPreference(
          'Credenciales',
          Constants.prefProxyCredentials,
          desc: 'Credenciales para emplear el servidor proxy',
          disabled: !this.proxyEnabled,
          onChange: updateProxyCredentialsSettings,
        ),
        TextFieldPreference(
          'Nombre de Usuario',
          Constants.prefProxyCredentialsName,
          defaultVal: '',
          disabled: !this.proxyEnabled || !this.credentialsEnabled,
        ),
        TextFieldPreference(
          'Contraseña',
          Constants.prefProxyCredentialsPassword,
          disabled: !this.proxyEnabled || !this.credentialsEnabled,
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
          desc:
              'Aceptar cualquier certificado de seguridad que sea devuelto al conectarse al proxy. '
              'Esta opción no tiene efecto si la conexión necesita el empleo de credenciales',
          disabled: !this.proxyEnabled,
        ),
        divider,
      ]),
    );
  }

  void updateProxySettings() {
    setState(() {
      this.proxyEnabled = PrefService.getBool(Constants.prefProxy);
    });
  }

  void updateProxyCredentialsSettings() {
    setState(() {
      this.credentialsEnabled =
          PrefService.getBool(Constants.prefProxyCredentials);
    });
  }

  String proxyUrlValidator(String str) {
    if (str.contains(' ')) {
      return "Dirección Inválida";
    }
    return null;
  }

  String proxyPortValidator(String str) {
    try {
      var value = int.parse(str);
      if (value <= 0) {
        return "Puerto incorrecto";
      }
    } catch (e) {
      return "Puerto incorrecto";
    }
    return null;
  }
}
