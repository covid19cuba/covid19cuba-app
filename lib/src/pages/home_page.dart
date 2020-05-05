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
  int currentTabIndex = 0;

  static var pages = <Widget>[
    CubaPage(),
    DataPage(),
    NewsPage(),
    WebViewPage(),
    InfoPage()
  ];

  static const tabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.data_usage),
      title: Text('Estadísticas'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.database),
      title: Text('Datos'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.solidNewspaper),
      title: Text('Noticias'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.notesMedical),
      title: Text('Pesquisa'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.infoCircle),
      title: Text('Información'),
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
