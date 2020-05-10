import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class EvolutionCasesRecoveredWidget extends StatelessWidget {
  final EvolutionOfCasesAndRecoveredByDays evolutionOfCasesAndRecoveredByDays;

  const EvolutionCasesRecoveredWidget({this.evolutionOfCasesAndRecoveredByDays})
      : assert(evolutionOfCasesAndRecoveredByDays != null);

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
              'Evolución por días de casos y altas diarias',
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
                id: evolutionOfCasesAndRecoveredByDays.diagnosed.name,
                colorFn: (_, __) => ChartColors.red,
                domainFn: (_, i) =>
                    evolutionOfCasesAndRecoveredByDays.date.values[i],
                measureFn: (item, _) => item,
                data: evolutionOfCasesAndRecoveredByDays.diagnosed.values,
              ),
              charts.Series<int, DateTime>(
                id: evolutionOfCasesAndRecoveredByDays.recovered.name,
                colorFn: (_, __) => ChartColors.blueLight,
                domainFn: (_, i) =>
                    evolutionOfCasesAndRecoveredByDays.date.values[i],
                measureFn: (item, _) => item,
                data: evolutionOfCasesAndRecoveredByDays.recovered.values,
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
            ],
          ),
        ),
      ],
    );
  }
}