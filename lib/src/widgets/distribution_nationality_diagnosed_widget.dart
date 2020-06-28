// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/item_code.dart';
import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class DistributionNationalityDiagnosedWidget extends StatelessWidget {
  final List<ItemCode> distributionByNationalityOfForeignCases;

  const DistributionNationalityDiagnosedWidget(
      {this.distributionByNationalityOfForeignCases})
      : assert(distributionByNationalityOfForeignCases != null);

  @override
  Widget build(BuildContext context) {
    if (distributionByNationalityOfForeignCases == null ||
        distributionByNationalityOfForeignCases.length == 0) {
      return Container();
    }
    String dialogText = '';
    for (var item in distributionByNationalityOfForeignCases) {
      dialogText += '\n' + item.code + ' = ' + item.name;
    }

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
                  'Distribución por nacionalidad de casos extranjeros',
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
                title: 'Distribución por nacionalidad de casos extranjeros',
                text: dialogText,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 250,
          child: charts.BarChart(
            [
              charts.Series<ItemCode, String>(
                id: 'Diagnosticados',
                colorFn: (_, __) => ChartColors.red,
                domainFn: (item, _) => item.code,
                measureFn: (item, _) => item.value,
                data: distributionByNationalityOfForeignCases,
              ),
            ],
            animate: false,
            defaultInteractions: true,
            behaviors: [
              charts.ChartTitle(
                'País',
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
