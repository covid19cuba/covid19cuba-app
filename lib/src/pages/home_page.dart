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
    JTNewsPage(),
    InfoPage(),
  ];

  static const tabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.notesMedical),
      title: Text(
        'Pesquisa',
        style: TextStyle(fontSize: 12),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.globe),
      title: Text(
        'Mundo',
        style: TextStyle(fontSize: 12),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.home),
      title: Text(
        'Cuba',
        style: TextStyle(fontSize: 12),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.solidNewspaper),
      title: Text(
        'Noticias',
        style: TextStyle(fontSize: 12),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.solidQuestionCircle),
      title: Text(
        'Consejos',
        style: TextStyle(fontSize: 12),
      ),
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
