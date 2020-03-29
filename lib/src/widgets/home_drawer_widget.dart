import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class HomeDrawerWidget extends StatefulWidget {
  @override
  _HomeDrawerWidgetState createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends State<HomeDrawerWidget> {
  String appName = '';
  String version = '';

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    var packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appName = packageInfo.appName;
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Constants.primaryColor,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Image.asset(Constants.appLogo),
                      padding: EdgeInsets.all(5),
                      width: 100,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Aplicación para conocer los reportes diarios, estadísticas, '
                'etc respecto a la Covid-19 en Cuba.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Los datos se actualizan a partir de la información oficial '
                'del MINSAP informados por las autoridades al día siguiente.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Puede contribuir al desarrollo de esta aplicación, pues '
                'es un proyecto de código abierto.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Ver el código fuente',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                const url =
                    'https://github.com/Covid19-Cuba-Efforts/covid19cuba-app';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  dev.log('Could not launch $url');
                }
              },
            ),
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Text(
                  'MatCom',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                const url = 'https://http://www.matcom.uh.cu';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  dev.log('Could not launch $url');
                }
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  'postData.club',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                const url = 'https://www.postdata.club';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  dev.log('Could not launch $url');
                }
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  'Juventud Técnica',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                const url = 'https://medium.com/juventud-técnica';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  dev.log('Could not launch $url');
                }
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Copyright 2020',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(padding: EdgeInsets.all(2)),
                  Icon(Icons.copyright, color: Colors.white),
                ],
              ),
            ),
            versionAppDrawerItem()
          ],
        ),
      ),
    );
  }

  Widget versionAppDrawerItem() {
    return ListTile(
      title: Text(
        'v$version',
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
      onTap: () {},
    );
  }
}
