import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  final WorldTotalsModel countries;

  SettingsPage({Key key, this.countries}) : super(key: key) {
    assert(countries != null);
  }

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
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
          defaultVal: Constants.defaultCompareCountry,
          values: getCountriesList(),
          displayValues: getCountriesList()
              .map((value) => WorldTotalsModel.prettyCountry(value))
              .toList(),
        ),
      ]),
    );
  }
}
