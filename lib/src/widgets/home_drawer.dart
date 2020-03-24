import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class HomeDrawer extends StatelessWidget {
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
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                      padding: EdgeInsets.all(5),
                      width: 100,
                    ),
                    /*Text(
                          Constants.appName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),*/
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
                'Puede contribuir al desarrollo de esta aplicación, pues '
                'es un proyecto de código abierto.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Ver el código fuente',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.link,
                color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
