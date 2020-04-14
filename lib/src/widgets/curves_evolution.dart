import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class CurvesEvolutionWidget extends StatefulWidget {
  final Map<String, dynamic> curvesEvolution;
  final DateTime updated;

  CurvesEvolutionWidget({this.curvesEvolution, this.updated})
      : assert(curvesEvolution != null, updated != null);

  @override
  CurvesEvolutionWidgetState createState() => CurvesEvolutionWidgetState(
        curvesEvolution: curvesEvolution,
        updated: updated,
      );
}

class CurvesEvolutionWidgetState extends State<CurvesEvolutionWidget> {
  final Map<String, dynamic> curvesEvolution;
  final DateTime updated;
  var colors = List<charts.Color>();
  var colorGen = RandomColor(0);

  CurvesEvolutionWidgetState({this.curvesEvolution, this.updated}) {
    assert(curvesEvolution != null);
    assert(updated != null);
    colors = curvesEvolution.entries.map((x) {
      return colorGen.randomChartColor();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var index = 0;
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
              'Evolución de la epidemia (paises seleccionados)',
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
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Center(
            child: Text(
              'El gráfico muestra a partir de 30 casos, en escala logarítmica '
              'y agrupados cada siete días, los casos nuevos por el total '
              'de casos confirmados de cada país. De esta manera, los países '
              'mientras siguen una línea recta están en un crecimeinto '
              'exponencial y cuando se desvían de la recta comienzan a salir '
              'del comportamiento exponencial. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 750,
          child: charts.LineChart(
            curvesEvolution.entries.map((item) {
              var localIndex = index++;
              return charts.Series<double, double>(
                id: DataModel.prettyCountry(item.key),
                colorFn: (_, __) => colors[localIndex],
                domainFn: (_, i) => item.value['cummulative_sum'][i],
                measureFn: (item, _) => item,
                data: List<double>.from(item.value['weeks']),
                domainLowerBoundFn: (_, __) => 1.4771212547196624,
              );
            }).toList(),
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
              radiusPx: 3.0,
              strokeWidthPx: 1.5,
            ),
            behaviors: [
              charts.ChartTitle(
                'Casos confirmados (log scale)',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 8),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                'Casos nuevos (log scale)',
                behaviorPosition: charts.BehaviorPosition.start,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 8),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                desiredMaxColumns: 2,
              ),
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.all,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
              ),
            ],
            domainAxis: charts.NumericAxisSpec(
              viewport: charts.NumericExtents(
                  1.45,
                  log(curvesEvolution.values.reduce((curr, next) {
                            return curr['total'] > next['total'] ? curr : next;
                          })['total']) /
                          ln10 +
                      0.1),
            ),
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
              'Datos de los países tomados '
              'de\ngithub.com/pomber/covid19\ny '
              'actualizado el '
              '${updated.toStrPlus()}',
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
