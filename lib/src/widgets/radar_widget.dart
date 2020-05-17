// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
//import 'package:covid19cuba/src/models/models.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class RadarChartWidget extends StatefulWidget{
  final Map<String, dynamic> data;

  const RadarChartWidget({this.data}) : assert(data != null);

  @override
  RadarChartWidgetState createState() => RadarChartWidgetState(
      bounds: (data['bounds'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : double.parse(e.toString()),
        )
      ),
      data: (data['data'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : e as Map<String, dynamic>,
        )
      ),
      countries: (data['data'] as Map<String, dynamic>).keys.toList(),
      cubaData: (data['data'] as Map<String, dynamic>)['Cuba'] as Map<String, dynamic>
  );
}

class RadarChartWidgetState extends State<RadarChartWidget> {

  final Map<String, double> bounds;
  final Map<String, Map<String,dynamic>> data;
  final List<String> countries;
  final Map<String, dynamic> cubaData;
  String selectedCountry = 'Estados Unidos';
  Map<String, dynamic> selectedData;

  RadarChartWidgetState({this.bounds, this.data, this.countries, this.cubaData}){
    assert(bounds != null);
    assert(data != null);
    assert(countries != null);
    assert(cubaData != null);
    selectedData=data[selectedCountry];
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
              setState(() {
                selectedCountry = newValue;
                selectedData=data[newValue];
              });
            },
            items: this.countries.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Container(
        child: Echarts(
        option: '''
        {
          title: {
              text: ''
          },
          tooltip: {},
          legend: {
              padding: [ 4, 4],
              data: ['Cuba'],
              bottom: -10,
              //itemGap: 20
          },
          radar: {
            // shape: 'circle',
            name: {
                textStyle: {
                    color: '#fff',
                    backgroundColor: '#999',
                    borderRadius: 3,
                    padding: [ 2, 2]
                }
            },
            indicator: [
                { name: 'Stringency Index' , max: 100},
                { name: 'Test por millón de habitantes', max: 100},
                { name: 'Casos por millón de habitantes', max: 100},
                { name: '% test positivos', max: 40},
                { name: '% casos fallecidos', max: 15},
                { name: '% casos recuperados', max: 100}
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
                value: [10,
                    10,
                    10,
                    10,
                    10,
                    10],
                name: 'Cuba'
              },
            ],
          }]
        }
        ''',
        ),
        padding: EdgeInsets.all(10),
        //width: 400,
        height: 350,
      )
      ],
    );
  }

}