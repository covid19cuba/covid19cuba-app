import 'package:charts_common/src/common/palette.dart'; // ignore: implementation_imports
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

// ignore: must_be_immutable
class PieSexWidget extends StatefulWidget {
  final DataModel data;
  List<Palette> colorPalettes;

  PieSexWidget({this.data}) : assert(data != null) {
    colorPalettes = charts.MaterialPalette.getOrderedPalettes(3);
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
              'Casos por Sexo',
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
                id: 'Casos por Sexo',
                colorFn: (_, i) => widget.colorPalettes[i].shadeDefault,
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.value,
                data: [
                  widget.data.casesBySex.men,
                  widget.data.casesBySex.women,
                  widget.data.casesBySex.unknown,
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
