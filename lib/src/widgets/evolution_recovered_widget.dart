// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class EvolutionRecoveredWidget extends StatelessWidget {
  final EvolutionOfRecoveredByDays evolutionOfRecoveredByDays;

  const EvolutionRecoveredWidget({this.evolutionOfRecoveredByDays})
      : assert(evolutionOfRecoveredByDays != null);

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
              'Evolución de altas por días',
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
              charts.Series<int, DateTime>(
                id: evolutionOfRecoveredByDays.daily.name,
                colorFn: (_, __) => ChartColors.blueDark,
                domainFn: (_, i) => evolutionOfRecoveredByDays.date.values[i],
                measureFn: (item, _) => item,
                data: evolutionOfRecoveredByDays.daily.values,
              ),
              charts.Series<int, DateTime>(
                id: evolutionOfRecoveredByDays.accumulated.name,
                colorFn: (_, __) => ChartColors.blueLight,
                domainFn: (_, i) => evolutionOfRecoveredByDays.date.values[i],
                measureFn: (item, _) => item,
                data: evolutionOfRecoveredByDays.accumulated.values,
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
                'Altas',
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
