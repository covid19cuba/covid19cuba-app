// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/item_double.dart';
import 'package:covid19cuba/src/models/charts/percent_of_symptomatics_and_asymptomatics.dart';
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';

// ignore: must_be_immutable
class PieSymptomaticsAsymptomaticsWidget extends StatefulWidget {
  final PercentSymptomaticsAsymptomatics percentSymptomaticsAsymptomatics;

  List<charts.Color> colorPalettes;

  PieSymptomaticsAsymptomaticsWidget({this.percentSymptomaticsAsymptomatics})
      : assert(percentSymptomaticsAsymptomatics != null) {
    colorPalettes = [ChartColors.purple, ChartColors.red];
  }

  @override
  PieSymptomaticsAsymptomaticsWidgetState createState() =>
      PieSymptomaticsAsymptomaticsWidgetState();
}

class PieSymptomaticsAsymptomaticsWidgetState
    extends State<PieSymptomaticsAsymptomaticsWidget> {
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
              'Casos sintomáticos/asintomáticos',
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
              charts.Series<ItemDouble, String>(
                id: 'Casos sintomáticos/asintomáticos',
                colorFn: (_, i) => widget.colorPalettes[i],
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.value,
                data: [
                  widget.percentSymptomaticsAsymptomatics.symptomatics,
                  widget.percentSymptomaticsAsymptomatics.asymptomatics,
                ],
              ),
            ],
            animate: false,
            behaviors: [
              charts.DatumLegend(
                position: charts.BehaviorPosition.bottom,
                cellPadding: EdgeInsets.all(10),
                showMeasures: true,
                measureFormatter: (num measure) {
                  return measure.toString() + '%';
                },
                legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                desiredMaxColumns: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
