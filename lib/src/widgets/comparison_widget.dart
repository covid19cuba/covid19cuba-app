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
  String selectedOption = 'Confirmados';

  final List<String> options = List<String>()
    ..add('Confirmados')
    ..add('Activos')
    ..add('Diarios')
    ..add('Recuperados')
    ..add('Fallecidos');
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

  charts.NumericAxisSpec getNumericAxisSpec() {
    int lenCuba;
    int lenForeign;
    switch (selectedOption) {
      case 'Confirmados':
        lenCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].confirmed.length;
        lenForeign = comparisonOfAccumulatedCases
            .countries[selectedCountry].confirmed.length;
        break;
      case 'Activos':
        lenCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].active.length;
        lenForeign = comparisonOfAccumulatedCases
            .countries[selectedCountry].active.length;
        break;
      case 'Diarios':
        lenCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].daily.length;
        lenForeign = comparisonOfAccumulatedCases
            .countries[selectedCountry].daily.length;
        break;
      case 'Recuperados':
        lenCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].recovered.length;
        lenForeign = comparisonOfAccumulatedCases
            .countries[selectedCountry].recovered.length;
        break;
      case 'Fallecidos':
        lenCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].deaths.length;
        lenForeign = comparisonOfAccumulatedCases
            .countries[selectedCountry].deaths.length;
        break;
    }
    return charts.NumericAxisSpec(
      viewport: charts.NumericExtents(1, max(lenForeign, lenCuba)),
    );
  }

  charts.NumericAxisSpec getNumericAxisSpecZoom() {
    var length = 0;
    switch (selectedOption) {
      case 'Confirmados':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].confirmed.length;
        break;
      case 'Activos':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].active.length;
        break;
      case 'Diarios':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].daily.length;
        break;
      case 'Recuperados':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].recovered.length;
        break;
      case 'Fallecidos':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].deaths.length;
        break;
    }
    return charts.NumericAxisSpec(viewport: charts.NumericExtents(1, length));
  }

  List<charts.ChartBehavior> getSpecBehaviors() {
    var length = 0;
    switch (selectedOption) {
      case 'Confirmados':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].confirmed.length;
        break;
      case 'Activos':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].active.length;
        break;
      case 'Diarios':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].daily.length;
        break;
      case 'Recuperados':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].recovered.length;
        break;
      case 'Fallecidos':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].deaths.length;
        break;
    }
    var behaviors = getBehaviors();
    behaviors.addAll([
      charts.RangeAnnotation([
        charts.LineAnnotationSegment(
          length - 1,
          charts.RangeAnnotationAxisType.domain,
          startLabel: 'Día $length',
        )
      ])
    ]);
    return behaviors;
  }

  List<charts.Series<int, int>> getSeries() {
    List<int> listCuba;
    List<int> listForeign;
    switch (selectedOption) {
      case 'Confirmados':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].confirmed;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].confirmed;
        break;
      case 'Activos':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].active;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].active;
        break;
      case 'Diarios':
        listCuba =
            comparisonOfAccumulatedCases.countries[Constants.countryCuba].daily;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].daily;
        break;
      case 'Recuperados':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].recovered;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].recovered;
        break;
      case 'Fallecidos':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].deaths;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].deaths;
        break;
    }
    return [
      charts.Series<int, int>(
        id: DataModel.prettyCountry(selectedCountry),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: listForeign,
      ),
      charts.Series<int, int>(
        id: Constants.countryCuba,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: listCuba,
      ),
    ];
  }

  List<charts.Series<int, int>> getZoomSeries() {
    List<int> listCuba;
    List<int> listForeign;
    switch (selectedOption) {
      case 'Confirmados':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].confirmed;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].confirmed;
        break;
      case 'Activos':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].active;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].active;
        break;
      case 'Diarios':
        listCuba =
            comparisonOfAccumulatedCases.countries[Constants.countryCuba].daily;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].daily;
        break;
      case 'Recuperados':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].recovered;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].recovered;
        break;
      case 'Fallecidos':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].deaths;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].deaths;
        break;
    }
    return [
      charts.Series<int, int>(
        id: DataModel.prettyCountry(selectedCountry),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: listForeign
            .take(
              min(listForeign.length, listCuba.length),
            )
            .toList(),
      ),
      charts.Series<int, int>(
        id: Constants.countryCuba,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: listCuba,
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
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Comparación de ${Constants.countryCuba}',
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
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Center(
            child: Text(
              'con',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
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
              PrefService.setString(Constants.prefCompareCountry, newValue);
              setState(() {
                selectedCountry = newValue;
              });
            },
            items: getCountriesList()
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(DataModel.prettyCountry(value)),
              );
            }).toList(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Center(
            child: Text(
              'por',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: DropdownButton<String>(
            value: selectedOption,
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
                selectedOption = newValue;
              });
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
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
            domainAxis: getNumericAxisSpec(),
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
            domainAxis: getNumericAxisSpecZoom(),
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
              'Datos de los países tomados '
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
