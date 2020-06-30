// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/cases_by_mode_of_contagion.dart';
import 'package:covid19cuba/src/models/charts/item.dart';
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';

// ignore: must_be_immutable
class PieContagionWidget extends StatefulWidget {
  final CasesByModeOfContagion casesByModeOfContagion;
  List<charts.Color> colorPalettes;

  PieContagionWidget({this.casesByModeOfContagion})
      : assert(casesByModeOfContagion != null) {
    colorPalettes = [
      ChartColors.red,
      ChartColors.purple,
      ChartColors.green,
      ChartColors.yellow,
    ];
  }

  @override
  PieContagionWidgetState createState() => PieContagionWidgetState();
}

class PieContagionWidgetState extends State<PieContagionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Center(
            child: Text(
              'Casos por Modo de Contagio',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 300,
          child: charts.PieChart(
            [
              charts.Series<Item, String>(
                id: 'Casos por Modo de Contagio',
                colorFn: (_, i) => widget.colorPalettes[i],
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.value,
                data: [
                  widget.casesByModeOfContagion.inserted,
                  widget.casesByModeOfContagion.imported,
                  widget.casesByModeOfContagion.autochthonous,
                  widget.casesByModeOfContagion.unknown,
                ],
              ),
            ],
            animate: false,
            behaviors: [
              charts.DatumLegend(
                position: charts.BehaviorPosition.bottom,
                cellPadding: EdgeInsets.all(10),
                showMeasures: true,
                legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                desiredMaxColumns: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
