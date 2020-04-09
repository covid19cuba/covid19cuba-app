import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'dart:math';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class CurvesEvolutionWidget extends StatelessWidget {
  final DataModel data;
  var colorGen=RandomColor(0); // random color generator with seed 0, for deterministic behaivor

  CurvesEvolutionWidget({this.data}) : assert(data != null);


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
              'El gráfico muestra a partir de 30 casos, en escala logarítmica y agrupados cada siete días, los casos nuevos por el total de casos confirmados de cada país. De esta manera, los países mientras siguen una línea recta están en un crecimeinto exponencial y cuando se desvían de la recta comienzan a salir del comportamiento exponencial. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 300,
          child: charts.LineChart(
            data.curvesEvolution.entries.map((item){
              return charts.Series<double, double>(
                id: item.key,
                colorFn: (_, __) => colorGen.randomChartColor(),
                domainFn: (_, i) => item.value['cummulative_sum'][i],
                measureFn: (item, _) => item,
                data: List<double>.from(item.value['weeks']),
                domainLowerBoundFn: (_, __) => 1.4771212547196624
              );
            }).toList().sublist(0,6).toList(), // esta con una sublista xq
            //hay q defnir q hacer ya q no caben todos los paises en la leyenda
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
              radiusPx: 3.0, // reduce the radious of the points
              strokeWidthPx: 1.5, //reduce the width of the line
            ),
            behaviors: [
              //charts.PanAndZoomBehavior(), // zoom con dos dedos a la gráfica
              charts.ChartTitle(
                'Casos confirmados (log scale)',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                'Casos nuevos (log scale)',
                behaviorPosition: charts.BehaviorPosition.start,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                desiredMaxColumns: 1,
                showMeasures: true,
                horizontalFirst: false,
                desiredMaxRows: 3,
              ),
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.all,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
              ),
            ],
            domainAxis: charts.NumericAxisSpec(
              // limitar el eje x entre 1.4<log10(30) y lon10 del país con mayor total + 0.1
              viewport: charts.NumericExtents(1.45,
                log(data.curvesEvolution.values.reduce((curr, next) => curr['total'] > next['total']? curr: next)['total'])/ln10+0.1)
            ),
          ),
        ),
      ],
    );
  }
}
