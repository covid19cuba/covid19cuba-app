// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/item_code_plus.dart';
import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class DistributionAgeGroupsDeceasesWidget extends StatelessWidget {
  final List<ItemCodePlus> distributionByAgeRanges;

  const DistributionAgeGroupsDeceasesWidget({this.distributionByAgeRanges})
      : assert(distributionByAgeRanges != null);

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
                  'Distribución de fallecidos por rangos etarios',
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
                title: 'Distribución de fallecidos por rangos etarios',
                text: '${distributionByAgeRanges.last.name} '
                    'representa edad desconocida',
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 350,
          child: charts.BarChart(
            [
              charts.Series<ItemCodePlus, String>(
                id: 'Fallecidos Hombres',
                seriesCategory: 'A',
                colorFn: (_, __) => ChartColors.purple,
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.men,
                data: distributionByAgeRanges,
              ),
              charts.Series<ItemCodePlus, String>(
                id: 'Fallecidos Mujeres',
                seriesCategory: 'A',
                colorFn: (_, __) => ChartColors.red,
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.women,
                data: distributionByAgeRanges,
              ),
              if (distributionByAgeRanges.any((x) => x.unknown != 0))
                charts.Series<ItemCodePlus, String>(
                  id: 'Fallecidos Sexo Desconocido',
                  seriesCategory: 'A',
                  colorFn: (_, __) => ChartColors.yellow,
                  domainFn: (item, _) => item.name,
                  measureFn: (item, _) => item.unknown,
                  data: distributionByAgeRanges,
                ),
              charts.Series<ItemCodePlus, String>(
                id: 'Fallecidos',
                seriesCategory: 'B',
                colorFn: (_, __) => ChartColors.grey,
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.value,
                data: distributionByAgeRanges,
              ),
            ],
            animate: false,
            defaultInteractions: true,
            barGroupingType: charts.BarGroupingType.groupedStacked,
            behaviors: [
              charts.ChartTitle(
                'Rango',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                'Fallecidos',
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
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
