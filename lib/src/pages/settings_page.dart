import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  final DataModel data;

  SettingsPage({Key key, this.data}) : super(key: key) {
    assert(data != null);
  }

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  List<String> getCountriesList() {
    var list = widget.data.comparisonOfAccumulatedCases.countries.keys
        .where((c) => c != Constants.countryCuba)
        .toList();
    list.sort((a, b) =>
        DataModel.prettyCountry(a).compareTo(DataModel.prettyCountry(b)));
    return list;
  }

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
        PreferenceTitle(
          'País a comparar por defecto:',
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        DropdownPreference(
          'País',
          Constants.prefCompareCountry,
          defaultVal: Constants.defaultCompareCountry,
          values: getCountriesList(),
          displayValues: getCountriesList()
              .map((value) => DataModel.prettyCountry(value))
              .toList(),
        ),
        PreferenceTitle(
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
        ),
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
          'Conectarse a un servidor de GitHub fuera de Cuba',
          Constants.ConnectionModeInternet,
          Constants.prefConnectionMode,
          desc: 'Mayor velocidad y estabilidad de conexión. '
              'Bueno para los usuarios que esten fuera de Cuba o aquellos '
              'que prefieren calidad de la conexión.',
        ),
        RadioPreference<int>(
          'Conectarse a un servidor de Cuba y si da error a uno externo a Cuba',
          Constants.ConnectionModeMerge,
          Constants.prefConnectionMode,
          desc: 'Opción recomendada para los usuario de Cuba. Permite '
              'ahorrar y si algo falla en el servidor ubicado en Cuba '
              'utilizar el externo a Cuba como respaldo.',
          isDefault: true,
        ),
      ]),
    );
  }
}
