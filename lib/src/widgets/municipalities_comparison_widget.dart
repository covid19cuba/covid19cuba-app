// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class MunicipalitiesComparisonWidget extends StatefulWidget {
  final DataModel data;
  final String province;

  const MunicipalitiesComparisonWidget({this.data, this.province})
      : assert(data != null);

  @override
  MunicipalitiesComparisonWidgetState createState() =>
      MunicipalitiesComparisonWidgetState(
        data: data,
        province: province,
      );
}

class MunicipalitiesComparisonWidgetState
    extends State<MunicipalitiesComparisonWidget> {
  String selectedMunicipality1 = '23.02';
  String selectedMunicipality2 = '25.01';
  String provinceCode;

  final DataModel data;
  final String province;

  MunicipalitiesComparisonWidgetState({this.data, this.province}) {
    assert(data != null);
    if (province != null) {
      provinceCode = Constants.provincesAbbreviationsCodes[province];
      selectedMunicipality1 = '$provinceCode.01';
      selectedMunicipality2 = '$provinceCode.02';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (provinceCode == '40.01') {
      return Container();
    }
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Comparación de los casos acumulados por municipios',
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
            value: selectedMunicipality1,
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
                selectedMunicipality1 = newValue;
              });
            },
            items: Constants.municipalitiesNames.keys.where((x) {
              if (provinceCode == null) {
                return true;
              }
              if (provinceCode == '40.01') {
                return x == '40.01';
              }
              var code = x.split('.')[0];
              return code == provinceCode;
            }).map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(province == null
                    ? Constants.municipalitiesNames[value]
                    : Constants.municipalitiesCodes[value]),
              );
            }).toList(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: DropdownButton<String>(
            value: selectedMunicipality2,
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
                selectedMunicipality2 = newValue;
              });
            },
            items: Constants.municipalitiesNames.keys.where((x) {
              if (provinceCode == null) {
                return true;
              }
              if (provinceCode == '40.01') {
                return x == '40.01';
              }
              var code = x.split('.')[0];
              return code == provinceCode;
            }).map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(province == null
                    ? Constants.municipalitiesNames[value]
                    : Constants.municipalitiesCodes[value]),
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
                id: Constants.municipalitiesCodes[selectedMunicipality1],
                colorFn: (_, __) => ChartColors.blue,
                domainFn: (_, i) => i,
                measureFn: (item, _) => item,
                data: data
                    .getMunicipality(selectedMunicipality1)
                    .all
                    .evolutionOfCasesByDays
                    .accumulated
                    .values,
              ),
              charts.Series<int, int>(
                id: Constants.municipalitiesCodes[selectedMunicipality2],
                colorFn: (_, __) => ChartColors.orange,
                domainFn: (_, i) => i,
                measureFn: (item, _) => item,
                data: data
                    .getMunicipality(selectedMunicipality2)
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
              if (PrefService.getBool(Constants.prefChartsZoom))
                charts.PanAndZoomBehavior(),
            ],
          ),
        ),
      ],
    );
  }
}
