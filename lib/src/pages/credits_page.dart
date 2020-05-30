// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:covid19cuba/src/data_providers/about_us_provider.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getAboutUsData(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Sobre Nosotros'),
            centerTitle: true,
          ),
          backgroundColor: Constants.primaryColor,
          body: Center(
            child: ListView(
              children: credits(context),
            ),
          ),
        );
      }
    );
  }

  List<Widget> credits(BuildContext context) {
    List<Widget> result = [];
    result.add(
      Container(
        child: Image.asset(Constants.appLogo),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(
          top: 50,
          left: 150,
          right: 150,
        ),
      ),
    );

    result.add(
      Container(
        margin: EdgeInsets.all(20),
        child: Text(
          'Aplicación para conocer los reportes diarios, estadísticas, '
          'etc respecto a la ${Constants.diseaseName} en Cuba.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    result.add(
      creditsText(
        text: 'Equipo de Desarrollo',
        topMargin: 30.0,
        bottomMargin: 20.0,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );

    for (var collaborator in List<Map<String,String>>()
      ..addAll(Constants.collaborators)
      ..sort((a, b) => a['name'].compareTo(b['name']))) {
      result.add(
        PresentationCard(
          name: collaborator['name'],
          description: collaborator['description'],
          link: collaborator['link'],
        ),
      );
    }

    result.add(
      creditsText(
        text: 'Colaboradores',
        topMargin: 50.0,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );

    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        linkText(
          'CUSOBU',
          'https://www.cusobu.nat.cu',
          topMargin: 0.0,
          rightMargin: 0.0,
          bottomMargin: 0.0,
          leftMargin: 0.0,
        ),
        linkText(
          'Proyecto SWL-X',
          'https://www.swlx.info',
          topMargin: 0.0,
          rightMargin: 0.0,
          bottomMargin: 0.0,
          leftMargin: 0.0,
        ),
        linkText(
          'Daxslab',
          'https://www.daxslab.com',
          topMargin: 0.0,
          rightMargin: 0.0,
          bottomMargin: 0.0,
          leftMargin: 0.0,
        ),
      ],
    ));

    result.add(Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        linkText(
          'Unión de Informáticos de Cuba',
          'https://www.uic.cu',
          topMargin: 15.0,
          rightMargin: 0.0,
          bottomMargin: 0.0,
          leftMargin: 0.0,
        ),
        linkText(
          'Universidad de Oriente',
          'https://www.uo.edu.cu',
          topMargin: 15.0,
          rightMargin: 0.0,
          bottomMargin: 0.0,
          leftMargin: 0.0,
        ),
        linkText(
          'Universidad de La Habana',
          'http://www.uh.cu',
          topMargin: 15.0,
          rightMargin: 0.0,
          bottomMargin: 0.0,
          leftMargin: 0.0,
        ),
      ],
    ));

    result.add(
      creditsText(
        text: 'Réplicas de nuestro Sitio Web',
        topMargin: 50.0,
        bottomMargin: 0.0,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );

    for (var item in Constants.replicas) {
      result.add(
        Replica(
          collaboratorText: item[0],
          url: item[1],
          collaboratorUrl: item[2],
          topMargin: 20,
        ),
      );
    }

    result.add(
      creditsText(
        text: 'Agradecimientos',
        topMargin: 50.0,
        bottomMargin: 0.0,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );

    result.add(
      Container(
        margin: EdgeInsets.all(20),
        child: Text(
          'El equipo de desarrollo de Covid19 Cuba Data agradece a todos '
          'los que de una forma u otra ayudan a combatir la pandemia de la '
          'Covid-19, en especial a los que arriesgan su vida luchando en '
          'primera línea.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    result.add(
      GestureDetector(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 50),
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
          const url = 'http://www.matcom.uh.cu';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            log('Could not launch $url');
          }
        },
      ),
    );

    result.add(
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
            log('Could not launch $url');
          }
        },
      ),
    );

    result.add(
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
            log('Could not launch $url');
          }
        },
      ),
    );

    result.add(
      GestureDetector(
        child: Container(
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
              Container(padding: EdgeInsets.all(2)),
              Text(
                'GPL-3.0',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        onTap: () async {
          const url =
              'https://raw.githubusercontent.com/covid19cuba/covid19cuba-app/master/LICENSE';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            log('Could not launch $url');
          }
        },
      ),
    );

    return result;
  }
}

Widget creditsText(
    {@required text,
    align = TextAlign.center,
    style = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    leftMargin: 50.0,
    rightMargin: 50.0,
    topMargin: 0.0,
    bottomMargin: 20.0}) {
  return ContainerizedText(
    text: text,
    style: style,
    align: align,
    leftMargin: leftMargin,
    rightMargin: rightMargin,
    topMargin: topMargin,
    bottomMargin: bottomMargin,
  );
}

Widget linkText(
  String text,
  String url, {
  leftMargin: 50.0,
  rightMargin: 50.0,
  topMargin: 10.0,
  bottomMargin: 30.0,
}) {
  Text txt = Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  return TouchableUrlWidget(
    txt,
    url,
    leftMargin: leftMargin,
    rightMargin: rightMargin,
    topMargin: topMargin,
    bottomMargin: bottomMargin,
  );
}
