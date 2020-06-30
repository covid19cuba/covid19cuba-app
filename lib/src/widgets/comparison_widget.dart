// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:covid19cuba/src/models/charts/curves_comparison.dart';
import 'package:covid19cuba/src/models/charts/curves_comparison_item.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:quiver/iterables.dart' show zip;

class ComparisonWidget extends StatefulWidget {
  final CurvesComparison comparisonOfAccumulatedCases;

  const ComparisonWidget({this.comparisonOfAccumulatedCases})
      : assert(comparisonOfAccumulatedCases != null);

  @override
  ComparisonWidgetState createState() => ComparisonWidgetState(
      comparisonOfAccumulatedCases: comparisonOfAccumulatedCases);
}

class ComparisonWidgetState extends State<ComparisonWidget> {
  String firstSelectedCountry = Constants.countryCuba;
  String secondSelectedCountry = Constants.defaultCompareCountry;
  String selectedOption = 'Confirmados';
  bool firstSelector = false;

  final List<String> options = List<String>()
    ..add('Confirmados')
    ..add('Activos')
    ..add('Diarios')
    ..add('Recuperados')
    ..add('Fallecidos')
    ..add('Stringency Index');

  final CurvesComparison comparisonOfAccumulatedCases;

  ComparisonWidgetState({this.comparisonOfAccumulatedCases}) {
    assert(comparisonOfAccumulatedCases != null);
    secondSelectedCountry =
        PrefService.getString(Constants.prefCompareCountry) ??
            Constants.defaultCompareCountry;
    if (!comparisonOfAccumulatedCases.countries.keys
        .contains(secondSelectedCountry)) {
      secondSelectedCountry = Constants.defaultCompareCountry;
      PrefService.setString(
          Constants.prefCompareCountry, secondSelectedCountry);
    }
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

  String getChartTitle() {
    if (selectedOption == 'Stringency Index') {
      return 'Valor del índice';
    }
    return 'Casos';
  }

  String getLegend() {
    if (selectedOption == 'Stringency Index') {
      return '';
    }
    return 'Casos';
  }

  String getMeasure(num measure) {
    if (selectedOption == 'Stringency Index') {
      return measure.toString();
    }
    return measure.toInt().toString();
  }

  List<dynamic> getCountryAttribute(CurvesComparisonItem country) {
    switch (selectedOption) {
      case 'Confirmados':
        return country.confirmed;
      case 'Fallecidos':
        return country.deaths;
      case 'Recuperados':
        return country.recovered;
      case 'Diarios':
        return country.daily;
      case 'Activos':
        return country.active;
      case 'Stringency Index':
        return country.stringency;
      default:
        return country.confirmed;
    }
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
        getChartTitle(),
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
          return '${getMeasure(measure)} ${getLegend()}';
        },
      ),
      charts.LinePointHighlighter(
        showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.all,
        showVerticalFollowLine:
            charts.LinePointHighlighterFollowLineType.nearest,
      ),
      if (PrefService.getBool(Constants.prefChartsZoom))
        charts.PanAndZoomBehavior(),
    ];
  }

  charts.NumericAxisSpec getNumericAxisSpec() {
    var firstLen = getCountryAttribute(
      comparisonOfAccumulatedCases.countries[firstSelectedCountry],
    ).length;
    var secondLen = getCountryAttribute(
      comparisonOfAccumulatedCases.countries[secondSelectedCountry],
    ).length;
    return charts.NumericAxisSpec(
      viewport: charts.NumericExtents(1, max(secondLen, firstLen)),
    );
  }

  charts.NumericAxisSpec getNumericAxisSpecZoom() {
    var length = getCountryAttribute(
      comparisonOfAccumulatedCases.countries[firstSelectedCountry],
    ).length;
    return charts.NumericAxisSpec(viewport: charts.NumericExtents(1, length));
  }

  List<charts.ChartBehavior> getSpecBehaviors() {
    var length = getCountryAttribute(
      comparisonOfAccumulatedCases.countries[firstSelectedCountry],
    ).length;
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

  String getFooter() {
    if (selectedOption == 'Stringency Index') {
      return 'El Oxford Stringency Index\n'
          'https://www.bsg.ox.ac.uk/research/research-projects/'
          'coronavirus-government-response-tracker\nevalúa las '
          'intervenciones del estado en la epidemia.\nLos valores '
          'se obtienen de\nhttps://covidtracker.'
          'bsg.ox.ac.uk/about-api';
    }
    return 'Datos de los países tomados '
        'de\nhttps://github.com/pomber/covid19\ny '
        'actualizado el '
        '${comparisonOfAccumulatedCases.updated.toStrPlus()}';
  }

  bool haveData() {
    var length = getCountryAttribute(
      comparisonOfAccumulatedCases.countries[secondSelectedCountry],
    ).length;
    return length != 0;
  }

  List<charts.Series<dynamic, int>> getSeries() {
    List<dynamic> firstList = getCountryAttribute(
        comparisonOfAccumulatedCases.countries[firstSelectedCountry]);
    List<dynamic> secondList = getCountryAttribute(
        comparisonOfAccumulatedCases.countries[secondSelectedCountry]);

    return [
      charts.Series<List, int>(
        id: comparisonOfAccumulatedCases.countries[firstSelectedCountry].name,
        colorFn: (_, __) => ChartColors.red,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item[0],
        data: zip([firstList]).toList(),
      ),
      charts.Series<List, int>(
        id: comparisonOfAccumulatedCases.countries[secondSelectedCountry].name,
        colorFn: (_, __) => ChartColors.blue,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item[0],
        data: zip([secondList]).toList(),
      ),
    ];
  }

  List<charts.Series<dynamic, int>> getZoomSeries() {
    List<dynamic> firstList = getCountryAttribute(
        comparisonOfAccumulatedCases.countries[firstSelectedCountry]);
    List<dynamic> secondList = getCountryAttribute(
        comparisonOfAccumulatedCases.countries[secondSelectedCountry]);

    return [
      charts.Series<List, int>(
        id: comparisonOfAccumulatedCases.countries[firstSelectedCountry].name,
        colorFn: (_, __) => ChartColors.red,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item[0],
        data: zip([firstList]).toList(),
      ),
      charts.Series<dynamic, int>(
        id: comparisonOfAccumulatedCases.countries[secondSelectedCountry].name,
        colorFn: (_, __) => ChartColors.blue,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item[0],
        data: zip([
          secondList.take(min(secondList.length, firstList.length)).toList(),
        ]).toList(),
      ),
    ];
  }

  Widget _buildsecondSelectedCountry(String iso3code) => Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(
                CountryPickerUtils.getCountryByIso3Code(iso3code),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  comparisonOfAccumulatedCases.countries[iso3code].name,
                ),
              ),
              Icon(Icons.arrow_downward),
            ],
          ),
          Container(
            height: 2,
            color: Constants.primaryColor.withOpacity(0.97),
          ),
        ],
      );

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Flexible(
            child: Text(
              comparisonOfAccumulatedCases.countries[country.iso3Code].name,
            ),
          ),
          // SizedBox(width: 8.0),
        ],
      );

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            semanticLabel: 'País seleccionado ' +
                comparisonOfAccumulatedCases
                    .countries[secondSelectedCountry].name,
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Buscar...'),
            searchEmptyView: Center(child: Text('No se encontró el país')),
            isSearchable: true,
            title: Text('Seleccione el país'),
            onValuePicked: (Country country) {
              PrefService.setString(
                Constants.prefCompareCountry,
                country.iso3Code,
              );
              setState(() {
                firstSelector
                    ? firstSelectedCountry = country.iso3Code
                    : secondSelectedCountry = country.iso3Code;
              });
            },
            itemFilter: (c) => comparisonOfAccumulatedCases.countries.keys
                .contains(c.iso3Code),
            itemBuilder: _buildDialogItem,
            sortComparator: (a, b) => comparisonOfAccumulatedCases
                .countries[a.iso3Code].name
                .compareTo(
                    comparisonOfAccumulatedCases.countries[b.iso3Code].name),
            searchFilter: (Country country, String value) {
              return comparisonOfAccumulatedCases
                  .countries[country.iso3Code].name
                  .toLowerCase()
                  .startsWith(value.toLowerCase());
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    //secondSelectedCountry = PrefService.getString(Constants.prefCompareCountry) ??
    //    Constants.defaultCompareCountry;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Comparación entre países',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              InfoDialogWidget(
                title: 'Comparación entre países',
                text: getFooter(),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 35, right: 35),
          child: ListTile(
            onTap: (() {
              firstSelector = true;
              _openCountryPickerDialog();
            }),
            title: _buildsecondSelectedCountry(firstSelectedCountry),
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
          margin: EdgeInsets.only(left: 35, right: 35),
          child: ListTile(
            onTap: (() {
              firstSelector = false;
              _openCountryPickerDialog();
            }),
            title: _buildsecondSelectedCountry(secondSelectedCountry),
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
          height: 300,
          alignment: Alignment.center,
          child: haveData()
              ? charts.LineChart(
                  getSeries(),
                  animate: false,
                  domainAxis: getNumericAxisSpec(),
                  defaultInteractions: true,
                  defaultRenderer: charts.LineRendererConfig(
                    includePoints: true,
                  ),
                  behaviors: getSpecBehaviors(),
                  selectionModels: getSelectionModels(),
                )
              : Text(
                  'No hay datos del país seleccionado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
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
              'Comparación en el período de ${comparisonOfAccumulatedCases.countries[firstSelectedCountry].name}',
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
          height: 300,
          alignment: Alignment.center,
          child: haveData()
              ? charts.LineChart(
                  getZoomSeries(),
                  animate: false,
                  domainAxis: getNumericAxisSpecZoom(),
                  defaultInteractions: true,
                  defaultRenderer: charts.LineRendererConfig(
                    includePoints: true,
                  ),
                  behaviors: getBehaviors(),
                  selectionModels: getSelectionModels(),
                )
              : Text(
                  'No hay datos del país seleccionado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ],
    );
  }
}
