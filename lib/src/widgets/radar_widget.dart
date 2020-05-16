// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class RadarChartWidget extends StatefulWidget{
  final RadarDataModel data;

  const RadarChartWidget({this.data}) : assert(data != null);

  @override
  RadarChartWidgetState createState() => RadarChartWidgetState();
}

class RadarChartWidgetState extends State<RadarChartWidget> {

  RadarChartWidgetState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Comparación de los casos acumulados por provincias',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

}