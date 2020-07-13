// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/pages/protocols_page.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getWidget(BuildContext context) {
  var widgets = <Widget>[
    Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        color: Constants.primaryColor,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Llame a Atención a la Población si tiene alguna duda '
                'sobre la situación de la pandemia de la Covid-19.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UsefulPhonesPage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Text(
                    'Atención a la Población',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        color: Constants.primaryColor,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Registre los contactos que tenga en el día, es muy importante.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactsListPage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Text(
                    'Registrar Contactos',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        color: Constants.primaryColor,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Conozca los síntomas y las medidas de prevención de la Covid-19.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InfoMorePage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Text(
                    'Ver síntomas y medidas de prevención',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        color: Constants.primaryColor,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Infórmese sobre los protocolos de actuación que contribuyen '
                'a la prevención, control y manejo de los casos relacionados '
                'con la enfermedad.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProtocolsPage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Text(
                    'Ver protocolos',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        color: Constants.primaryColor,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Acceda a los boletines especiales enfocados en la '
                'Covid-19 del Centro de Estudios Demográficos (CEDEM) de la '
                'Universidad de La Habana.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BulletinsPage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Text(
                    'Acceder a los boletines',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        color: Constants.primaryColor,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Puede descargar la información utilizada en la aplicación '
                'desde la sección de Descargas.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DownloadsPage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Text(
                    'Ir a Descargas',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        color: Constants.primaryColor,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Verifique las medidas a implementar en la etapa de '
                'recuperación post Covid-19 y cuál es la fase en la '
                    'que se encuentran las provincias.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PhasesPage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Text(
                    'Ver información sobre las medidas',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  ];
  var random = Random();
  var pos = random.nextInt(widgets.length);
  return widgets[pos];
}

bool shouldBe({double p = 0.5}) {
  var random = Random();
  var x = random.nextDouble();
  return x <= p;
}
