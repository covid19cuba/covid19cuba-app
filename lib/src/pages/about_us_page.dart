// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer' as dev;
import 'dart:math';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/about_us/about_us.dart';
import 'package:covid19cuba/src/models/about_us/about_us_state.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralBloc.getAboutUsBloc(),
      child: AboutUsPageWidget(),
    );
  }
}

class AboutUsPageWidget extends PageWidget<AboutUs, AboutUsState> {
  AboutUsPageWidget()
      : super(
          getWidgetLoaded,
          title: 'Sobre Nosotros',
          isDark: true,
        );

  static Widget getWidgetLoaded(
    BuildContext context,
    LoadedGeneralState<AboutUs> state,
  ) {
    return Center(
      child: ListView(
        children: aboutUs(state.data),
      ),
    );
  }

  static List<Widget> aboutUs(AboutUs data) {
    List<Widget> result = [];
    result.add(Container(
      child: Image.asset(Constants.appLogo),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(
        top: 50,
        left: 150,
        right: 150,
      ),
    ));
    result.add(Container(
      margin: EdgeInsets.all(20),
      child: Text(
        'Aplicación para conocer los reportes diarios, estadísticas, '
        'etc respecto a la ${Constants.diseaseName} en Cuba.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ));
    result.add(creditsText(
      text: 'Equipo de Desarrollo',
      topMargin: 30.0,
      bottomMargin: 20.0,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ));
    for (var member in data.teamMembers
      ..sort((a, b) => a.name.compareTo(b.name))) {
      result.add(PresentationCard(
        name: member.name,
        description: member.description,
        link: member.link,
      ));
    }
    result.add(creditsText(
      text: 'Colaboradores',
      topMargin: 50.0,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ));
    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: data.collaborators
          .sublist(0, min(data.collaborators.length, 3))
          .map(
            (e) => linkText(
              e.name,
              e.url,
              topMargin: 0.0,
              rightMargin: 0.0,
              bottomMargin: 0.0,
              leftMargin: 0.0,
            ),
          )
          .toList(),
    ));
    result.add(Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: data.collaborators
          .sublist(min(data.collaborators.length, 3), data.collaborators.length)
          .map(
            (e) => linkText(
              e.name,
              e.url,
              topMargin: 15.0,
              rightMargin: 0.0,
              bottomMargin: 0.0,
              leftMargin: 0.0,
            ),
          )
          .toList(),
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
    for (var item in data.replicas) {
      result.add(Replica(
        collaboratorText: item.text,
        url: item.url,
        collaboratorUrl: item.replicaUrl,
        topMargin: 20,
      ));
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
          data.thanks,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    for (int i = 0; i < data.promoters.length; i++) {
      var item = data.promoters[i];
      result.add(GestureDetector(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: i == 0 ? 50 : 20),
          child: Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        onTap: () async {
          var url = item.url;
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            dev.log('Could not launch $url');
          }
        },
      ));
    }
    result.add(GestureDetector(
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
          dev.log('Could not launch $url');
        }
      },
    ));
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
