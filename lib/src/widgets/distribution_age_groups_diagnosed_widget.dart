import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class DistributionAgeGroupsDiagnosedWidget extends StatelessWidget {
  final DataModel data;

  const DistributionAgeGroupsDiagnosedWidget({this.data})
      : assert(data != null);

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
              'Distribución por rangos etarios',
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
          height: 250,
          child: charts.BarChart(
            [
              charts.Series<ItemCode, String>(
                id: 'Diagnosticados',
                colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.value,
                data: data.distributionByAgeRanges,
              ),
            ],
            animate: false,
            defaultInteractions: true,
            behaviors: [
              charts.ChartTitle(
                'Rango',
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
                measureFormatter: (num measure) {
                  if (measure == null) return '';
                  return measure.toInt().toString() + ' Casos';
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
      ],
    );
  }
}
