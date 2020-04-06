import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class HomeDrawerWidget extends StatefulWidget {
  final DataModel data;

  HomeDrawerWidget({this.data}) : assert(data != null);

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
                'etc respecto a la ${Constants.diseaseName} en Cuba.',
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
            linksDrawerItem(),
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            sharerDrawerItem(),
            settingsDrawerItem(),
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
                  'Postdata.club',
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
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            versionAppDrawerItem()
          ],
        ),
      ),
    );
  }

  Widget createDrawerItem(
    BuildContext context, {
    IconData icon,
    String text,
    GestureTapCallback onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget linksDrawerItem() {
    return ExpansionTile(
      title: Text(
        'Enlaces de Interés',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        createDrawerItem(
          context,
          icon: Icons.android,
          text: 'Enlace de Apklis',
          onTap: () async {
            const url =
                'https://www.apklis.cu/application/club.postdata.covid19cuba';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              dev.log('Could not launch $url');
            }
          },
        ),
        createDrawerItem(
          context,
          icon: FontAwesomeIcons.chrome,
          text: 'Web - Internet',
          onTap: () async {
            const url = 'https://covid19cubadata.github.io';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              dev.log('Could not launch $url');
            }
          },
        ),
        createDrawerItem(
          context,
          icon: FontAwesomeIcons.home,
          text: 'Web - Red Cubana',
          onTap: () async {
            const url = 'http://www.cusobu.nat.cu/covid/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              dev.log('Could not launch $url');
            }
          },
        ),
        createDrawerItem(
          context,
          icon: FontAwesomeIcons.telegram,
          text: 'Canal de Telegram',
          onTap: () async {
            const url = 'https://t.me/covid19cubadata';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              dev.log('Could not launch $url');
            }
          },
        ),
        createDrawerItem(
          context,
          icon: FontAwesomeIcons.robot,
          text: 'Bot de Telegram',
          onTap: () async {
            const url = 'https://t.me/covid19cubadata_bot';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              dev.log('Could not launch $url');
            }
          },
        ),
        createDrawerItem(
          context,
          icon: FontAwesomeIcons.github,
          text: 'Enlace de GitHub',
          onTap: () async {
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
    );
  }

  Widget sharerDrawerItem() {
    return createDrawerItem(
      context,
      icon: Icons.share,
      text: 'Compartir',
      onTap: () async {
        Share.share(
          'Yo uso $appName: la aplicación para conocer los reportes diarios, '
          'estadísticas, etc respecto a la ${Constants.diseaseName} en Cuba.\n'
          '\nDisponible en Apklis: https://www.apklis.cu/application/club.postdata.covid19cuba',
          subject: '$appName',
        );
      },
    );
  }

  Widget settingsDrawerItem() {
    return createDrawerItem(
      context,
      icon: Icons.settings,
      text: 'Configuración',
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsPage(data: widget.data),
          ),
        );
      },
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
