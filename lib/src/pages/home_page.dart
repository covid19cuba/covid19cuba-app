// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/utils/cuba_icon_icons.dart';

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

  List<BottomNavigationBarItem> getTabs() {
    var badgeNews = PrefService.getBool(Constants.prefBadgeNews) ?? false;
    return <BottomNavigationBarItem>[
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
        // icon: Icon(FontAwesomeIcons.home),
        icon: Container(
          margin: EdgeInsets.only(bottom: 6.0, right: 22.0, top: 6.0),
          child: Icon(CubaIcon.cuba, size: 12.0),
        ),
        title: Text(
          'Cuba',
          style: TextStyle(fontSize: 12),
        ),
      ),
      BottomNavigationBarItem(
        icon: Badge(
          showBadge: badgeNews,
          child: Icon(FontAwesomeIcons.solidNewspaper),
        ),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTabIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Constants.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: getTabs(),
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
