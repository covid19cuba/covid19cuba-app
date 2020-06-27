// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/distribution_of_cases.dart';
import 'package:covid19cuba/src/models/charts/item.dart';
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';

// ignore: must_be_immutable
class DistributionOfCasesWidget extends StatefulWidget {
  final DistributionOfCases distributionOfCases;
  List<charts.Color> colorPalettes;

  DistributionOfCasesWidget({this.distributionOfCases})
      : assert(distributionOfCases != null) {
    colorPalettes = [
      ChartColors.purple,
      ChartColors.grey,
      ChartColors.blue,
      ChartColors.red,
    ];
  }

  @override
  DistributionOfCasesWidgetState createState() =>
      DistributionOfCasesWidgetState();
}

class DistributionOfCasesWidgetState extends State<DistributionOfCasesWidget> {
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
              'Distribución de los casos',
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
                    id: 'Distribución de los casos',
                    colorFn: (_, i) => widget.colorPalettes[i],
                    domainFn: (item, _) => item.name,
                    measureFn: (item, _) => item.value,
                    data: [
                      widget.distributionOfCases.deaths,
                      widget.distributionOfCases.evacuees,
                      widget.distributionOfCases.recovered,
                      widget.distributionOfCases.active,
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
                    legendDefaultMeasure:
                        charts.LegendDefaultMeasure.firstValue,
                    desiredMaxColumns: 2,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Text(
                  '${widget.distributionOfCases.cases.value} '
                  '${widget.distributionOfCases.cases.name}',
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
