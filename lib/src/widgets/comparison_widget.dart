import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class ComparisonWidget extends StatefulWidget {
  final DataModel data;
  final WorldTotalsModel countries;

  const ComparisonWidget({this.data, this.countries})
      : assert(data != null),
        assert(countries != null);

  @override
  ComparisonWidgetState createState() =>
      ComparisonWidgetState(data: data, countries: countries);
}

class ComparisonWidgetState extends State<ComparisonWidget> {
  String selectedCountry = 'Greece';
  final DataModel data;
  final WorldTotalsModel countries;

  ComparisonWidgetState({this.data, this.countries})
      : assert(data != null),
        assert(countries != null);

  List<String> getCountriesList() {
    var list = countries.countries.keys.where((c) => c != 'Cuba').toList();
    list.sort((a, b) => WorldTotalsModel.prettyCountry(a)
        .compareTo(WorldTotalsModel.prettyCountry(b)));
    return list;
  }

  List<charts.ChartBehavior> getBehaviors() {
    return [
      charts.ChartTitle(
        'Días',
        behaviorPosition: charts.BehaviorPosition.bottom,
        titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
        titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
      ),
      charts.ChartTitle(
        'Casos',
        behaviorPosition: charts.BehaviorPosition.start,
        titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
        titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
      ),
      charts.SeriesLegend(
        position: charts.BehaviorPosition.bottom,
        desiredMaxColumns: 1,
      ),
      charts.LinePointHighlighter(
        showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.all,
        showVerticalFollowLine:
            charts.LinePointHighlighterFollowLineType.nearest,
      ),
    ];
  }

  List<charts.Series<int, int>> getSeries() {
    return [
      charts.Series<int, int>(
        id: WorldTotalsModel.prettyCountry(selectedCountry),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: countries.countries[selectedCountry],
      ),
      charts.Series<int, int>(
        id: 'Cuba',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: data.accumulated,
      ),
    ];
  }

  List<charts.Series<int, int>> getZoomSeries() {
    return [
      charts.Series<int, int>(
        id: WorldTotalsModel.prettyCountry(selectedCountry),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: countries.countries[selectedCountry].sublist(
            0,
            min(data.accumulated.length,
                countries.countries[selectedCountry].length)),
      ),
      charts.Series<int, int>(
        id: 'Cuba',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: data.accumulated,
      ),
    ];
  }

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
              'Comparación de los casos acumulados de Cuba con:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        DropdownButton<String>(
          value: selectedCountry,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Constants.primaryColor),
          underline: Container(
            height: 2,
            color: Constants.primaryColor,
          ),
          onChanged: (String newValue) {
            setState(() {
              selectedCountry = newValue;
            });
          },
          items:
              getCountriesList().map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(WorldTotalsModel.prettyCountry(value)),
            );
          }).toList(),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Center(
            child: Text(
              'Comparación en general',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 250,
          child: charts.LineChart(
            getSeries(),
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
            ),
            behaviors: getBehaviors(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Center(
            child: Text(
              'Comparación en el período de Cuba',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 250,
          child: charts.LineChart(
            getZoomSeries(),
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
            ),
            behaviors: getBehaviors(),
          ),
        ),
      ],
    );
  }
}
