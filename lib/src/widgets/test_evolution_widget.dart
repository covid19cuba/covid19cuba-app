// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/tests_by_days.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';
import 'package:quiver/iterables.dart' show zip;
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class TestEvolutionWidget extends StatelessWidget {
  final TestsByDays testsByDays;

  const TestEvolutionWidget({this.testsByDays}) : assert(testsByDays != null);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Tests (PCR) por días',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              InfoDialogWidget(
                title: 'Tests (PCR) por días',
                text: 'Esta información se reporta desde el '
                    '${testsByDays.date.values[0].toStrPlus()}',
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 350,
          child: charts.TimeSeriesChart(
            [
              charts.Series<List, DateTime>(
                id: testsByDays.positive.name,
                colorFn: (_, __) => ChartColors.red,
                domainFn: (item, _) => item[1],
                measureFn: (item, _) => item[0],
                data: zip([
                  testsByDays.positive.values,
                  testsByDays.date.values,
                ]).toList(),
              ),
              charts.Series<List, DateTime>(
                id: testsByDays.total.name,
                colorFn: (_, __) => ChartColors.green,
                domainFn: (item, _) => item[1],
                measureFn: (item, _) => item[0],
                data: zip([
                  testsByDays.total.values,
                  testsByDays.date.values,
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
                'Tests en el día',
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
              if (PrefService.getBool(Constants.prefChartsZoom))
                charts.PanAndZoomBehavior(),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
