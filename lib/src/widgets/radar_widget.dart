// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:math';
import 'package:covid19cuba/src/models/charts/multiple_comparison_with_radar.dart';
import 'package:covid19cuba/src/models/charts/radar_bound.dart';
import 'package:covid19cuba/src/models/charts/radar_item.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class RadarChartWidget extends StatefulWidget {
  final MultipleComparisonWithRadar data;

  const RadarChartWidget({this.data}) : assert(data != null);

  @override
  RadarChartWidgetState createState() {
    return RadarChartWidgetState(
      bounds: data.bounds,
      data: data,
      countries: data.data.keys.toList(),
      cubaData: data.data['Cuba'],
    );
  }
}

class RadarChartWidgetState extends State<RadarChartWidget> {
  final RadarBound bounds;
  final MultipleComparisonWithRadar data;
  final List<String> countries;
  final RadarItem cubaData;
  String selectedCountry = 'Estados Unidos';
  RadarItem selectedData;

  RadarChartWidgetState({
    this.bounds,
    this.data,
    this.countries,
    this.cubaData,
  })  : assert(bounds != null),
        assert(data != null),
        assert(countries != null),
        assert(cubaData != null) {
    selectedData = data.data[selectedCountry];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Comparación múltiple de Cuba con: ',
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
            value: selectedCountry,
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
              setState(
                () {
                  selectedCountry = newValue;
                  selectedData = data.data[newValue];
                },
              );
            },
            items: this.countries.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ),
        Container(
          child: Echarts(
            extraScript: '''
          function round(number, digits = 2) {
              return Math.round((number + Number.EPSILON) * 10 ** digits) / 10 ** digits;
          }
        ''',
            option: '''
        {
          title: {
              text: ''
          },
          tooltip: {
            position: function(pt){
                        return [0,0];
                    }
          },
          legend: {
              data: ['Cuba','$selectedCountry'],
              bottom: -5,
              itemGap: 20
          },
          radar: {
            // shape: 'circle',
            nameGap: 5,
            radius: '58%',
            name: {
              textStyle: {
                color: '#fff',
                backgroundColor: '#999',
                borderRadius: 3,
                fontSize: 11,
                padding: [2, 2]
              }
            },
            indicator: [
              { name: 'Test por millón de habitantes', max: ${selectedData.testPerMillionBound}},
              { name: '% test positivos', max: ${bounds.testPercent}},
              { name: 'Stringency Index' , max: ${bounds.stringency}},
              { name: 'Casos por millón de habitantes', max: ${selectedData.confirmedPerMillionBound}},
              { name: '% casos recuperados', max: ${bounds.recoveredPercent}},
              { name: '% casos fallecidos', max: ${bounds.deathPercent}}
            ]
          },
          series: [{
             name: '',
            type: 'radar',
            emphasis: {
                areaStyle: {normal: {}}
            },
            data: [
              {
                value: [${cubaData.testPerMillionBound},
                    round(${cubaData.testPercent}),
                    ${cubaData.stringency},
                    ${cubaData.confirmedPerMillion},
                    round(${cubaData.recoveredPercent}),
                    round(${cubaData.deathPercent})],
                name: 'Cuba'
              },
              {
                value: [${selectedData.testPerMillionBound},
                    round(${selectedData.testPercent}),
                    ${selectedData.stringency},
                    ${selectedData.confirmedPerMillion},
                    round(${selectedData.recoveredPercent}),
                    round(${selectedData.deathPercent})],
                name: '$selectedCountry',
              }
            ],
          }]
        }
        ''',
          ),
          padding: EdgeInsets.all(10),
          height: min(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height) -
              25,
        ),
        Container(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
