import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class EvolutionCasesWidget extends StatelessWidget {
  final DataModel data;

  const EvolutionCasesWidget({this.data}) : assert(data != null);

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
              charts.Series<DayModel, DateTime>(
                id: 'Casos en el día',
                colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
                domainFn: (item, _) => item.date,
                measureFn: (item, _) =>
                    item.diagnosed != null ? item.diagnosed.length : 0,
                data: data.days,
              ),
              charts.Series<int, DateTime>(
                id: 'Casos activos',
                colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                domainFn: (_, i) => data.days[i].date,
                measureFn: (item, _) => item,
                data: data.actives,
              ),
              charts.Series<int, DateTime>(
                id: 'Casos acumulados',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (_, i) => data.days[i].date,
                measureFn: (item, _) => item,
                data: data.accumulated,
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
