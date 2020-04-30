import 'dart:developer';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class EffectiveReproductiveNumberWidget extends StatelessWidget {
  final EffectiveReproductiveNumber effectiveReproductiveNumber;

  const EffectiveReproductiveNumberWidget({this.effectiveReproductiveNumber})
      : assert(effectiveReproductiveNumber != null);

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
              'Número Reproductivo Efectivo',
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
              charts.Series<double, DateTime>(
                id: effectiveReproductiveNumber.upper.name,
                colorFn: (_, __) => ChartColors.pink,
                domainFn: (_, i) => effectiveReproductiveNumber.date.values[i],
                measureFn: (item, _) => item,
                data: effectiveReproductiveNumber.upper.values,
              ),
              charts.Series<double, DateTime>(
                id: effectiveReproductiveNumber.value.name,
                colorFn: (_, __) => ChartColors.red,
                domainFn: (_, i) => effectiveReproductiveNumber.date.values[i],
                measureFn: (item, _) => item,
                data: effectiveReproductiveNumber.value.values,
              ),
              charts.Series<double, DateTime>(
                id: effectiveReproductiveNumber.lower.name,
                colorFn: (_, __) => ChartColors.pink,
                domainFn: (_, i) => effectiveReproductiveNumber.date.values[i],
                measureFn: (item, _) => item,
                data: effectiveReproductiveNumber.lower.values,
              ),
            ],
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
              radiusPx: 2,
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
                'Número Reproductivo Efectivo',
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
              charts.RangeAnnotation([
                charts.LineAnnotationSegment(
                  1,
                  charts.RangeAnnotationAxisType.measure,
                  color: charts.MaterialPalette.gray.shadeDefault,
                )
              ])
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
            child: Linkify(
              text: 'El Número Reproductivo Efectivo\n'
                  'https://en.wikipedia.org/wiki/basic_reproduction_number\n'
                  'se cálcula en base al método propuesto por Anne Cori\n'
                  'https://cran.r-project.org/package=EpiEstim\n\n'
                  'Es una colaboración del Investigador Waldemar Baldoquín '
                  'del IPK y se actualizará periódicamente en base a sus '
                  'cálculos. Los márgenes refieren al rango con 95% de '
                  'confianza.',
              options: LinkifyOptions(humanize: true),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 12,
              ),
              linkStyle: TextStyle(
                color: Constants.primaryColor,
                fontSize: 12,
              ),
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  log('Could not launch $link');
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
