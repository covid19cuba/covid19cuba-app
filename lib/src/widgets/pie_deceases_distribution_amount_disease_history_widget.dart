// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class PieDeceasesDistributionAmountDiseaseHistoryWidget
    extends StatelessWidget {
  final Map<String, Item> deceasesDistributionAmountDiseaseHistory;
  //final List<charts.Color> colorPalettes;

  PieDeceasesDistributionAmountDiseaseHistoryWidget(
      {this.deceasesDistributionAmountDiseaseHistory});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Center(
          child: Text(
            'Distribución de la cantidad de antecedentes de enfermedad por fallecido',
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
              id: 'Conmorbilidades',
              domainFn: (item, _) => item.name,
              measureFn: (item, _) => item.value,
              data: deceasesDistributionAmountDiseaseHistory.values.toList(),
            )
          ],
          animate: false,
          behaviors: [
            charts.DatumLegend(
              position: charts.BehaviorPosition.bottom,
              cellPadding: EdgeInsets.all(3),
              showMeasures: true,
              legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
              desiredMaxColumns: 2,
            ),
          ],
        ),
      ),
    ]);
  }
}
