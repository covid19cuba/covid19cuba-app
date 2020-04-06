import 'package:charts_common/src/common/palette.dart'; // ignore: implementation_imports
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

// ignore: must_be_immutable
class PieTestsPercentWidget extends StatefulWidget {
  final DataModel data;
  List<Palette> colorPalettes;

  PieTestsPercentWidget({this.data}) : assert(data != null) {
    colorPalettes = charts.MaterialPalette.getOrderedPalettes(2);
  }

  @override
  PieTestsPercentWidgetState createState() => PieTestsPercentWidgetState();
}

class PieTestsPercentWidgetState extends State<PieTestsPercentWidget> {
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
              'Relación de tests realizados',
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
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              charts.PieChart(
                [
                  charts.Series<Item, String>(
                    id: 'Relación de tests realizados',
                    colorFn: (_, i) => widget.colorPalettes[i].shadeDefault,
                    domainFn: (item, _) => item.name,
                    measureFn: (item, _) =>
                        item.value *
                        100 /
                        widget.data.listOfTestsPerformed.total.value,
                    data: [
                      widget.data.listOfTestsPerformed.positive,
                      widget.data.listOfTestsPerformed.negative
                    ],
                  ),
                ],
                animate: false,
                defaultRenderer: charts.ArcRendererConfig(arcWidth: 30),
                behaviors: [
                  charts.DatumLegend(
                    position: charts.BehaviorPosition.bottom,
                    cellPadding: EdgeInsets.all(10),
                    showMeasures: true,
                    measureFormatter: (num measure) {
                      return measure.toStringAsFixed(2) + '%';
                    },
                    legendDefaultMeasure:
                        charts.LegendDefaultMeasure.firstValue,
                    desiredMaxColumns: 1,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Text(
                  '${widget.data.listOfTestsPerformed.total.value} '
                  'tests',
                  style: TextStyle(
                    color: Constants.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
