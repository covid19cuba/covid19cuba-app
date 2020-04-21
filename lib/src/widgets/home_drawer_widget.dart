import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preferences.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class HomeDrawerWidget extends StatefulWidget {
  @override
  HomeDrawerWidgetState createState() => HomeDrawerWidgetState();
}

class HomeDrawerWidgetState extends State<HomeDrawerWidget> {
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
            createDrawerItem(
              context,
              icon: Icons.location_city,
              text: 'Provincias',
              onTap: () async {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProvinceListPage(),
                  ),
                );
              },
            ),
            createDrawerItem(
              context,
              icon: Icons.location_city,
              text: 'Municipios',
              onTap: () async {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MunicipalityListPage(),
                  ),
                );
              },
            ),
            createDrawerItem(
              context,
              icon: Icons.assignment,
              text: 'Pesquisador Virtual',
              onTap: () async {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewPage(),
                  ),
                );
              },
            ),
            createDrawerItem(
              context,
              icon: Icons.table_chart,
              text: 'Tabla de Casos',
              onTap: () async {
                const urlCU = 'https://www.cusobu.nat.cu/covid/casos.html';
                const urlIO = 'https://covid19cubadata.github.io/casos.html';
                String url;
                var mode = PrefService.getInt(Constants.prefConnectionMode) ??
                    Constants.ConnectionModeMerge;
                switch (mode) {
                  case Constants.ConnectionModeIntranet:
                    url = urlCU;
                    break;
                  case Constants.ConnectionModeInternet:
                    url = urlIO;
                    break;
                  case Constants.ConnectionModeMerge:
                  default:
                    url = urlCU;
                    break;
                }
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  log('Could not launch $url');
                }
              },
            ),
            linksDrawerItem(),
            updateDrawerItem(),
            sharerDrawerItem(),
            settingsDrawerItem(),
            faqsDrawerItem(),
            creditsDrawerItem(),
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
            versionAppDrawerItem(),
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
      initiallyExpanded: false,
      title: Row(
        children: <Widget>[
          Icon(
            Icons.link,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Enlaces de Interés',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
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
              log('Could not launch $url');
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
              log('Could not launch $url');
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
              log('Could not launch $url');
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
              log('Could not launch $url');
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
              log('Could not launch $url');
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
              log('Could not launch $url');
            }
          },
        ),
      ],
    );
  }

  Widget updateDrawerItem() {
    return createDrawerItem(
      context,
      icon: Icons.update,
      text: 'Actualizar',
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdatePage(first: false),
          ),
        );
      },
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
            builder: (context) => SettingsPage(),
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
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChangelogPage(),
          ),
        );
      },
    );
  }

  Widget faqsDrawerItem() {
    return createDrawerItem(
      context,
      icon: Icons.question_answer,
      text: 'Preguntas Frecuentes',
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FaqsPage(),
          ),
        );
      },
    );
  }

  Widget creditsDrawerItem() {
    return createDrawerItem(
      context,
      icon: Icons.people,
      text: 'Sobre Nosotros',
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreditsPage(),
          ),
        );
      },
    );
  }
}
