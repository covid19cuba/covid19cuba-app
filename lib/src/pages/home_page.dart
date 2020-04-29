import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentTabIndex = 2;

  static var pages = <Widget>[
    WebViewPage(),
    WorldPage(),
    CubaPage(),
    ProvinceListPage(),
    MunicipalityListPage(),
  ];

  static const tabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.notesMedical),
      title: Text('Pesquisa'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.globe),
      title: Text('Mundo'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.home),
      title: Text('Cuba'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.city),
      title: Text('Provincias'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.building),
      title: Text('Municipios'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Constants.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: tabs,
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
    );
  }
}
