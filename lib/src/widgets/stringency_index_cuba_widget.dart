// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/stringency_index_cuba.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';
import 'package:quiver/iterables.dart' show zip;

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class StringencyIndexCubaWidget extends StatelessWidget {
  final StringencyIndexCuba stringencyIndexCuba;

  const StringencyIndexCubaWidget({
    this.stringencyIndexCuba,
  }) : assert(stringencyIndexCuba != null);

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
                  'Evolución del Oxford Stringency Index para Cuba',
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
                title: 'Oxford Stringency Index',
                text: 'El Oxford Stringency Index\n'
                    'https://www.bsg.ox.ac.uk/research/research-projects/'
                    'coronavirus-government-response-tracker\nevalúa las '
                    'intervenciones del estado en la epidemia.\nLos valores '
                    'se obtienen de\nhttps://covidtracker.'
                    'bsg.ox.ac.uk/about-api\n\n\n'
                    'El índice fue revisado y actualizado por Oxford y se '
                    'incorporaron nuevos criterios. Por tanto, en la gráfica '
                    'se mostrarán los valores de la versión actual (v2) y de '
                    'la versión previa (v1)',
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Evaluación actual: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Constants.primaryColor,
                ),
              ),
              Text(
                stringencyIndexCuba.data.lastWhere((x) => x != null).toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              Text(
                '/100',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Constants.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 400,
          child: charts.TimeSeriesChart(
            [
              charts.Series<List, DateTime>(
                id: 'Stringency actual (v2)',
                colorFn: (_, __) => ChartColors.red,
                domainFn: (item, _) => item[1],
                measureFn: (item, _) => item[0],
                data: zip([
                  stringencyIndexCuba.data,
                  stringencyIndexCuba.days,
                ]).toList(),
              ),
              charts.Series<List, DateTime>(
                id: 'Stringency previo (v1)',
                colorFn: (_, __) => ChartColors.purple,
                domainFn: (item, _) => item[1],
                measureFn: (item, _) => item[0],
                data: zip([
                  stringencyIndexCuba.dataLegacy,
                  stringencyIndexCuba.days,
                ]).toList(),
              ),
            ],
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
            ),
            behaviors: [
              charts.RangeAnnotation(
                stringencyIndexCuba.moments
                    .map(
                      (moment) => charts.LineAnnotationSegment(
                        moment.date,
                        charts.RangeAnnotationAxisType.domain,
                        endLabel: moment.value,
                        color: charts.MaterialPalette.blue.shadeDefault,
                      ),
                    )
                    .toList(),
              ),
              charts.ChartTitle(
                'Fecha',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                'Valor del índice',
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
