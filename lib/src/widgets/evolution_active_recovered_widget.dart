// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/evolution_of_active_and_recovered_accumulated.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';
import 'package:quiver/iterables.dart' show zip;

import 'package:covid19cuba/src/utils/utils.dart';

class EvolutionActiveRecoveredWidget extends StatelessWidget {
  final EvolutionOfActiveAndRecoveredAccumulated
      evolutionOfActiveAndRecoveredAccumulated;

  const EvolutionActiveRecoveredWidget(
      {this.evolutionOfActiveAndRecoveredAccumulated})
      : assert(evolutionOfActiveAndRecoveredAccumulated != null);

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
              'Evolución por días de casos activos y altas acumuladas',
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
              charts.Series<List, DateTime>(
                id: evolutionOfActiveAndRecoveredAccumulated.active.name,
                colorFn: (_, __) => ChartColors.red,
                domainFn: (item, _) => item[1],
                measureFn: (item, _) => item[0],
                data: zip([
                  evolutionOfActiveAndRecoveredAccumulated.active.values,
                  evolutionOfActiveAndRecoveredAccumulated.date.values,
                ]).toList(),
              ),
              charts.Series<List, DateTime>(
                id: evolutionOfActiveAndRecoveredAccumulated.recovered.name,
                colorFn: (_, __) => ChartColors.blueLight,
                domainFn: (item, _) => item[1],
                measureFn: (item, _) => item[0],
                data: zip([
                  evolutionOfActiveAndRecoveredAccumulated.recovered.values,
                  evolutionOfActiveAndRecoveredAccumulated.date.values,
                ]).toList(),
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
