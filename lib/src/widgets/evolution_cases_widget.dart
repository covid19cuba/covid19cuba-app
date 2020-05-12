// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class EvolutionCasesWidget extends StatelessWidget {
  final EvolutionOfCasesByDays evolutionOfCasesByDays;

  const EvolutionCasesWidget({this.evolutionOfCasesByDays})
      : assert(evolutionOfCasesByDays != null);

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
              'Evolución de casos por días',
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
          height: 400,
          child: charts.TimeSeriesChart(
            [
                  charts.Series<int, DateTime>(
                    id: evolutionOfCasesByDays.daily.name,
                    colorFn: (_, __) => ChartColors.blueDark,
                    domainFn: (_, i) => evolutionOfCasesByDays.date.values[i],
                    measureFn: (item, _) => item,
                    data: evolutionOfCasesByDays.daily.values,
                  )
                ] +
                (evolutionOfCasesByDays.active != null
                    ? [
                        charts.Series<int, DateTime>(
                          id: evolutionOfCasesByDays.active.name,
                          colorFn: (_, __) => ChartColors.redDark,
                          domainFn: (_, i) =>
                              evolutionOfCasesByDays.date.values[i],
                          measureFn: (item, _) => item,
                          data: evolutionOfCasesByDays.active.values,
                        ),
                      ]
                    : []) +
                [
                  charts.Series<int, DateTime>(
                    id: evolutionOfCasesByDays.accumulated.name,
                    colorFn: (_, __) => ChartColors.pink,
                    domainFn: (_, i) => evolutionOfCasesByDays.date.values[i],
                    measureFn: (item, _) => item,
                    data: evolutionOfCasesByDays.accumulated.values,
                  ),
                ],
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
            ),
            behaviors: [
              charts.ChartTitle(
                'Fecha',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                'Casos',
                behaviorPosition: charts.BehaviorPosition.start,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                desiredMaxColumns: 1,
                showMeasures: true,
              ),
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.all,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
