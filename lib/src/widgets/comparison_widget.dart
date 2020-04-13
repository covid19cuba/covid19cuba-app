import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class ComparisonWidget extends StatefulWidget {
  final ComparisonOfAccumulatedCases comparisonOfAccumulatedCases;

  const ComparisonWidget({this.comparisonOfAccumulatedCases})
      : assert(comparisonOfAccumulatedCases != null);

  @override
  ComparisonWidgetState createState() => ComparisonWidgetState(
      comparisonOfAccumulatedCases: comparisonOfAccumulatedCases);
}

class ComparisonWidgetState extends State<ComparisonWidget> {
  String selectedCountry = Constants.defaultCompareCountry;
  final ComparisonOfAccumulatedCases comparisonOfAccumulatedCases;

  ComparisonWidgetState({this.comparisonOfAccumulatedCases}) {
    assert(comparisonOfAccumulatedCases != null);
    if (getCountriesList().indexOf(selectedCountry) == -1) {
      selectedCountry = Constants.defaultCompareCountry;
      PrefService.setString(Constants.prefCompareCountry, selectedCountry);
    }
  }

  List<String> getCountriesList() {
    var list = comparisonOfAccumulatedCases.countries.keys
        .where((c) => c != Constants.countryCuba)
        .toList();
    list.sort((a, b) =>
        DataModel.prettyCountry(a).compareTo(DataModel.prettyCountry(b)));
    return list;
  }

  List<charts.SelectionModelConfig<num>> getSelectionModels() {
    return [
      charts.SelectionModelConfig(
        changedListener: (charts.SelectionModel<num> model) {
          /*for (var datum in model.selectedDatum) {
            // This could be used for further customization
            print('${datum.series.id}: ${datum.datum}');
          }*/
        },
      ),
    ];
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
        showMeasures: true,
        measureFormatter: (num measure) {
          if (measure == null) return '';
          return measure.toInt().toString() + ' Casos';
        },
      ),
      charts.LinePointHighlighter(
        showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.all,
        showVerticalFollowLine:
            charts.LinePointHighlighterFollowLineType.nearest,
      ),
    ];
  }

  List<charts.ChartBehavior> getSpecBehaviors() {
    var behaviors = getBehaviors();
    behaviors.addAll([
      charts.RangeAnnotation([
        charts.LineAnnotationSegment(
          comparisonOfAccumulatedCases.countries[Constants.countryCuba].length -
              1,
          charts.RangeAnnotationAxisType.domain,
          startLabel:
              'Día ${comparisonOfAccumulatedCases.countries[Constants.countryCuba].length}',
        )
      ])
    ]);
    return behaviors;
  }

  List<charts.Series<int, int>> getSeries() {
    return [
      charts.Series<int, int>(
        id: DataModel.prettyCountry(selectedCountry),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: comparisonOfAccumulatedCases.countries[selectedCountry],
      ),
      charts.Series<int, int>(
        id: Constants.countryCuba,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: comparisonOfAccumulatedCases.countries[Constants.countryCuba],
      ),
    ];
  }

  List<charts.Series<int, int>> getZoomSeries() {
    return [
      charts.Series<int, int>(
        id: DataModel.prettyCountry(selectedCountry),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: comparisonOfAccumulatedCases.countries[selectedCountry]
            .take(
              min(
                comparisonOfAccumulatedCases.countries[selectedCountry].length,
                comparisonOfAccumulatedCases
                    .countries[Constants.countryCuba].length,
              ),
            )
            .toList(),
      ),
      charts.Series<int, int>(
        id: Constants.countryCuba,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: comparisonOfAccumulatedCases.countries[Constants.countryCuba],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    selectedCountry = PrefService.getString(Constants.prefCompareCountry) ??
        Constants.defaultCompareCountry;
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
              'Comparación de los casos acumulados '
              'de ${Constants.countryCuba} con:',
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
            PrefService.setString(Constants.prefCompareCountry, newValue);
            setState(() {
              selectedCountry = newValue;
            });
          },
          items:
              getCountriesList().map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(DataModel.prettyCountry(value)),
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
            domainAxis: charts.NumericAxisSpec(
              viewport: charts.NumericExtents(
                1,
                max(
                  comparisonOfAccumulatedCases
                      .countries[selectedCountry].length,
                  comparisonOfAccumulatedCases
                      .countries[Constants.countryCuba].length,
                ),
              ),
            ),
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
            ),
            behaviors: getSpecBehaviors(),
            selectionModels: getSelectionModels(),
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
              'Comparación en el período de ${Constants.countryCuba}',
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
            domainAxis: charts.NumericAxisSpec(
              viewport: charts.NumericExtents(
                  1,
                  comparisonOfAccumulatedCases
                      .countries[Constants.countryCuba].length),
            ),
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
            ),
            behaviors: getBehaviors(),
            selectionModels: getSelectionModels(),
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
            child: Text(
              'Solo se muestran los países en los que se detectó el primero '
              'caso antes que Cuba.\n\nDatos de los países tomados '
              'de\ngithub.com/pomber/covid19\ny '
              'actualizado el '
              '${comparisonOfAccumulatedCases.updated.toStrPlus()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
