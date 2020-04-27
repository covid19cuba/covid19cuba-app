import 'dart:developer';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class StringencyIndexCubaWidget extends StatelessWidget {
  final EvolutionOfCasesByDays evolutionOfCasesByDays;
  final StringencyIndexCubaModel stringencyIndexCuba;

  const StringencyIndexCubaWidget({
    this.evolutionOfCasesByDays,
    this.stringencyIndexCuba,
  }) : assert(evolutionOfCasesByDays != null);

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
              'Evolución del Oxford Stringency Index para Cuba',
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
              charts.Series<double, DateTime>(
                id: 'Stringency',
                colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                domainFn: (_, i) => stringencyIndexCuba.days[i],
                measureFn: (item, _) => item,
                data: stringencyIndexCuba.data,
              ),
              charts.Series<int, DateTime>(
                id: 'Confirmados',
                colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
                domainFn: (_, i) => evolutionOfCasesByDays.date.values[i],
                measureFn: (item, _) => item,
                data: evolutionOfCasesByDays.accumulated.values,
              )..setAttribute(
                  charts.measureAxisIdKey,
                  'secondaryMeasureAxisId',
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
                        startLabel: moment.value,
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
              charts.ChartTitle(
                'Casos confirmados',
                behaviorPosition: charts.BehaviorPosition.end,
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
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20,
          ),
          child: Center(
            child: Linkify(
              text: 'El Oxford Stringency Index\n'
                  'https://www.bsg.ox.ac.uk/research/research-projects/'
                  'coronavirus-government-response-tracker\nevalúa las '
                  'intervenciones del estado en la epidemia.\nLos valores '
                  'se obtienen de\nhttps://covidtracker.'
                  'bsg.ox.ac.uk/about-api',
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
