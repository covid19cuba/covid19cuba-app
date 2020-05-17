// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class ProvincesComparisonWidget extends StatefulWidget {
  final Map<String, ProvincesModel> provinces;

  const ProvincesComparisonWidget({this.provinces}) : assert(provinces != null);

  @override
  ProvincesComparisonWidgetState createState() =>
      ProvincesComparisonWidgetState(
        provinces: provinces,
      );
}

class ProvincesComparisonWidgetState extends State<ProvincesComparisonWidget> {
  String selectedProvince1 = 'lha';
  String selectedProvince2 = 'mat';

  final Map<String, ProvincesModel> provinces;

  ProvincesComparisonWidgetState({this.provinces}) {
    assert(provinces != null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Comparación de los casos acumulados por provincias',
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
          margin: EdgeInsets.only(left: 50, right: 50),
          child: DropdownButton<String>(
            value: selectedProvince1,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            isExpanded: true,
            elevation: 16,
            style: TextStyle(color: Constants.primaryColor),
            underline: Container(
              height: 2,
              color: Constants.primaryColor,
            ),
            onChanged: (String newValue) {
              setState(() {
                selectedProvince1 = newValue;
              });
            },
            items: Constants.provinceAbbreviations.keys
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(Constants.provinceAbbreviations[value]),
              );
            }).toList(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: DropdownButton<String>(
            value: selectedProvince2,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            isExpanded: true,
            elevation: 16,
            style: TextStyle(color: Constants.primaryColor),
            underline: Container(
              height: 2,
              color: Constants.primaryColor,
            ),
            onChanged: (String newValue) {
              setState(() {
                selectedProvince2 = newValue;
              });
            },
            items: Constants.provinceAbbreviations.keys
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(Constants.provinceAbbreviations[value]),
              );
            }).toList(),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 300,
          child: charts.LineChart(
            <charts.Series<int, int>>[
              charts.Series<int, int>(
                id: Constants.provinceAbbreviations[selectedProvince1],
                colorFn: (_, __) => ChartColors.blue,
                domainFn: (_, i) => i,
                measureFn: (item, _) => item,
                data: provinces[selectedProvince1]
                    .all
                    .evolutionOfCasesByDays
                    .accumulated
                    .values,
              ),
              charts.Series<int, int>(
                id: Constants.provinceAbbreviations[selectedProvince2],
                colorFn: (_, __) => ChartColors.orange,
                domainFn: (_, i) => i,
                measureFn: (item, _) => item,
                data: provinces[selectedProvince2]
                    .all
                    .evolutionOfCasesByDays
                    .accumulated
                    .values,
              ),
            ],
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
            ),
            behaviors: <charts.ChartBehavior>[
              charts.ChartTitle(
                'Días',
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
              if (PrefService.getBool(Constants.prefChartsZoom)) charts.PanAndZoomBehavior(),
            ],
          ),
        ),
      ],
    );
  }
}
