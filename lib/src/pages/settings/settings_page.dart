import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../utils/constants.dart';
import 'package:covid19cuba/src/models/configuration.dart';
import 'package:covid19cuba/src/models/models.dart';

class SettingsPage extends StatefulWidget {
  final WorldTotalsModel countries;
  final ConfigurationModel config;
  SettingsPage({Key key, this.countries, this.config}) : super(key: key) {
    assert(config != null);
    assert(countries != null);
  }

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  SettingsPageState();
  List<String> getCountriesList() {
    var list = widget.countries.countries.keys
        .where((c) => c != Constants.countryCuba)
        .toList();
    list.sort((a, b) => WorldTotalsModel.prettyCountry(a)
        .compareTo(WorldTotalsModel.prettyCountry(b)));
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
          'General',
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        DropdownPreference(
          'País a comparar',
          Constants.prefCompareCountry,
          defaultVal: widget.config.compareCountry,
          values: getCountriesList(),
          displayValues: getCountriesList().map((value) => WorldTotalsModel.prettyCountry(value)).toList(),
          onChange: (newValue) {
            print('save data settings: ' + newValue);
            widget.config.saveCountry(newValue);
          },
        ),
      ]),
    );
  }
}
