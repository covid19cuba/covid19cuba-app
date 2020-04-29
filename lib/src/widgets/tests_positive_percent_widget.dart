import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class TestsPositivePercentWidget extends StatelessWidget {
  final TestsPositivePercent testsPositivePercent;

  const TestsPositivePercentWidget({this.testsPositivePercent})
      : assert(testsPositivePercent != null);

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
              '% Tests Positivos con respecto a Total de Tests (PCR)',
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
              charts.Series<double, DateTime>(
                id: testsPositivePercent.daily.name,
                colorFn: (_, __) => ChartColors.red,
                domainFn: (_, i) => testsPositivePercent.date.values[i],
                measureFn: (item, _) => item,
                data: testsPositivePercent.daily.values,
              ),
              charts.Series<double, DateTime>(
                id: testsPositivePercent.accumulated.name,
                colorFn: (_, __) => ChartColors.purple,
                domainFn: (_, i) => testsPositivePercent.date.values[i],
                measureFn: (item, _) => item,
                data: testsPositivePercent.accumulated.values,
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
                'Por ciento (%)',
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
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20,
          ),
          child: Center(
            child: Text(
              'Esta información se reporta desde el '
              '${testsPositivePercent.date.values[0].toStrPlus()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
