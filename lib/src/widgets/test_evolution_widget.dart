import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class TestEvolutionWidget extends StatelessWidget {
  final DataModel data;

  const TestEvolutionWidget({this.data}) : assert(data != null);

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
              'Tests por días',
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
          height: 350,
          child: charts.BarChart(
            [
              charts.Series<int, String>(
                id: data.testsByDays.negative.name,
                seriesCategory: 'A',
                colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
                domainFn: (_, i) =>
                    data.testsByDays.date.values[i].toStrShort(),
                measureFn: (item, _) => item,
                data: data.testsByDays.negative.values,
              ),
              charts.Series<int, String>(
                id: data.testsByDays.positive.name,
                seriesCategory: 'A',
                colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                domainFn: (_, i) =>
                    data.testsByDays.date.values[i].toStrShort(),
                measureFn: (item, _) => item,
                data: data.testsByDays.positive.values,
              ),
              charts.Series<int, String>(
                id: data.testsByDays.total.name,
                seriesCategory: 'B',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (_, i) =>
                    data.testsByDays.date.values[i].toStrShort(),
                measureFn: (item, _) => item,
                data: data.testsByDays.total.values,
              ),
            ],
            animate: false,
            barGroupingType: charts.BarGroupingType.groupedStacked,
            defaultInteractions: true,
            behaviors: [
              charts.ChartTitle(
                'Días',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                'Tests por días',
                behaviorPosition: charts.BehaviorPosition.start,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                desiredMaxColumns: 1,
                showMeasures: true,
                measureFormatter: (num measure) {
                  if (measure == null) return '';
                  return measure.toInt().toString();
                },
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
              '${data.testsByDays.date.values[0].toStrPlus()}',
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
