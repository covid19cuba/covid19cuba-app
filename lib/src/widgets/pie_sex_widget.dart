// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/cases_by_sex.dart';
import 'package:covid19cuba/src/models/charts/item.dart';
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';

// ignore: must_be_immutable
class PieSexWidget extends StatefulWidget {
  final CasesBySex casesBySex;
  List<charts.Color> colorPalettes;
  String title;

  PieSexWidget({this.casesBySex, this.title}) : assert(casesBySex != null) {
    if (title == null) title = 'Casos';
    colorPalettes = [ChartColors.purple, ChartColors.red, ChartColors.green];
  }

  @override
  PieSexWidgetState createState() => PieSexWidgetState();
}

class PieSexWidgetState extends State<PieSexWidget> {
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
              '${widget.title} por Sexo',
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
          height: 300,
          child: charts.PieChart(
            [
              charts.Series<Item, String>(
                id: '${widget.title} por Sexo',
                colorFn: (_, i) => widget.colorPalettes[i],
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.value,
                data: [
                  widget.casesBySex.men,
                  widget.casesBySex.women,
                  widget.casesBySex.unknown,
                ],
              ),
            ],
            animate: false,
            behaviors: [
              charts.DatumLegend(
                position: charts.BehaviorPosition.bottom,
                cellPadding: EdgeInsets.all(10),
                showMeasures: true,
                legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                desiredMaxColumns: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
