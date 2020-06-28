// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/percent_evolution_of_symptomatics_and_asymptomatics.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';
import 'package:quiver/iterables.dart' show zip;

import 'package:covid19cuba/src/utils/utils.dart';

class PercentEvolutionSymptomaticsAsymptomaticsAccumulatedWidget
    extends StatelessWidget {
  final PercentEvolutionSymptomaticsAsymptomatics
      percentEvolutionSymptomaticsAsymptomatics;

  const PercentEvolutionSymptomaticsAsymptomaticsAccumulatedWidget(
      {this.percentEvolutionSymptomaticsAsymptomatics})
      : assert(percentEvolutionSymptomaticsAsymptomatics != null);

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
              'Evolución del porciento de casos sintomáticos/asintomáticos acumulados',
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
          child: charts.TimeSeriesChart(
            [
              charts.Series<List, DateTime>(
                id: percentEvolutionSymptomaticsAsymptomatics
                    .asymptomatics.name,
                colorFn: (_, __) => ChartColors.purple,
                domainFn: (item, _) => item[1],
                measureFn: (item, _) => item[0],
                data: zip([
                  percentEvolutionSymptomaticsAsymptomatics
                      .asymptomatics.values,
                  percentEvolutionSymptomaticsAsymptomatics.date.values,
                ]).toList(),
              ),
              charts.Series<List, DateTime>(
                id: percentEvolutionSymptomaticsAsymptomatics.symptomatics.name,
                colorFn: (_, __) => ChartColors.red,
                domainFn: (item, _) => item[1],
                measureFn: (item, _) => item[0],
                data: zip([
                  percentEvolutionSymptomaticsAsymptomatics.symptomatics.values,
                  percentEvolutionSymptomaticsAsymptomatics.date.values,
                ]).toList(),
              ),
            ],
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includeArea: true,
              includePoints: true,
              stacked: true,
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
                '% de casos acumulados',
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
              if (PrefService.getBool(Constants.prefChartsZoom))
                charts.PanAndZoomBehavior(),
            ],
          ),
        ),
      ],
    );
  }
}
