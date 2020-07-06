// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/item.dart';
import 'package:covid19cuba/src/models/charts/relation_of_tests_performed.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PieTestsPercentWidget extends StatefulWidget {
  final RelationOfTestsPerformed listOfTestsPerformed;
  List<charts.Color> colorPalettes;

  PieTestsPercentWidget({this.listOfTestsPerformed})
      : assert(listOfTestsPerformed != null) {
    colorPalettes = [
      ChartColors.red,
      ChartColors.purple,
    ];
  }

  @override
  PieTestsPercentWidgetState createState() => PieTestsPercentWidgetState();
}

class PieTestsPercentWidgetState extends State<PieTestsPercentWidget> {
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
              'Relación de tests (PCR) realizados',
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
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              charts.PieChart(
                [
                  charts.Series<Item, String>(
                    id: 'Relación de tests realizados',
                    colorFn: (_, i) => widget.colorPalettes[i],
                    domainFn: (item, _) => item.name,
                    measureFn: (item, _) =>
                        item.value *
                        100 /
                        widget.listOfTestsPerformed.total.value,
                    data: [
                      widget.listOfTestsPerformed.positive,
                      widget.listOfTestsPerformed.negative
                    ],
                  ),
                ],
                animate: false,
                defaultRenderer: charts.ArcRendererConfig(arcWidth: 30),
                behaviors: [
                  charts.DatumLegend(
                    position: charts.BehaviorPosition.bottom,
                    cellPadding: EdgeInsets.all(10),
                    showMeasures: true,
                    measureFormatter: (num measure) {
                      return measure.toStringAsFixed(2) + '%';
                    },
                    legendDefaultMeasure:
                        charts.LegendDefaultMeasure.firstValue,
                    desiredMaxColumns: 1,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Text(
                  '${widget.listOfTestsPerformed.total.value} '
                  'tests',
                  style: TextStyle(
                    color: Constants.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
