import 'dart:math';
import 'dart:developer' as dev;

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:preferences/preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
    ..add('Fallecidos')
    ..add('Stringency Index');

  final ComparisonOfAccumulatedCases comparisonOfAccumulatedCases;

  ComparisonWidgetState({this.comparisonOfAccumulatedCases}) {
    assert(comparisonOfAccumulatedCases != null);
    selectedCountry = PrefService.getString(Constants.prefCompareCountry) ??
        Constants.defaultCompareCountry;
    if (!comparisonOfAccumulatedCases.countries.keys
        .contains(selectedCountry)) {
      selectedCountry = Constants.defaultCompareCountry;
      PrefService.setString(Constants.prefCompareCountry, selectedCountry);
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
    switch (selectedOption) {
      case 'Confirmados':
      case 'Activos':
      case 'Diarios':
      case 'Recuperados':
      case 'Fallecidos':
        return 'Casos';
      case 'Stringency Index':
        return 'Valor del índice';
    }
    return '';
  }

  String getLegend() {
    switch (selectedOption) {
      case 'Confirmados':
      case 'Activos':
      case 'Diarios':
      case 'Recuperados':
      case 'Fallecidos':
        return 'Casos';
      case 'Stringency Index':
        return '';
    }
    return '';
  }

  String getMeasure(num measure) {
    switch (selectedOption) {
      case 'Confirmados':
      case 'Activos':
      case 'Diarios':
      case 'Recuperados':
      case 'Fallecidos':
        return measure.toInt().toString();
      case 'Stringency Index':
        return measure.toString();
    }
    return '';
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
      case 'Stringency Index':
        lenCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].stringency.length;
        lenForeign = comparisonOfAccumulatedCases
            .countries[selectedCountry].stringency.length;
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
      case 'Stringency Index':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].stringency.length;
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
      case 'Stringency Index':
        length = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].stringency.length;
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

  String getFooter() {
    String footer;
    switch (selectedOption) {
      case 'Confirmados':
      case 'Activos':
      case 'Diarios':
      case 'Recuperados':
      case 'Fallecidos':
        footer = 'Datos de los países tomados '
            'de\nhttps://github.com/pomber/covid19\ny '
            'actualizado el '
            '${comparisonOfAccumulatedCases.updated.toStrPlus()}';
        break;
      case 'Stringency Index':
        footer = 'El Oxford Stringency Index\n'
            'https://www.bsg.ox.ac.uk/research/research-projects/'
            'coronavirus-government-response-tracker\nevalúa las '
            'intervenciones del estado en la epidemia.\nLos valores '
            'se obtienen de\nhttps://covidtracker.'
            'bsg.ox.ac.uk/about-api';
        break;
    }
    return footer;
  }

  bool haveData() {
    var length = 0;
    switch (selectedOption) {
      case 'Confirmados':
        length = comparisonOfAccumulatedCases
            .countries[selectedCountry].confirmed.length;
        break;
      case 'Activos':
        length = comparisonOfAccumulatedCases
            .countries[selectedCountry].active.length;
        break;
      case 'Diarios':
        length = comparisonOfAccumulatedCases
            .countries[selectedCountry].daily.length;
        break;
      case 'Recuperados':
        length = comparisonOfAccumulatedCases
            .countries[selectedCountry].recovered.length;
        break;
      case 'Fallecidos':
        length = comparisonOfAccumulatedCases
            .countries[selectedCountry].deaths.length;
        break;
      case 'Stringency Index':
        length = comparisonOfAccumulatedCases
            .countries[selectedCountry].stringency.length;
        break;
    }
    return length != 0;
  }

  List<charts.Series<dynamic, int>> getSeries() {
    List<dynamic> listCuba;
    List<dynamic> listForeign;
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
      case 'Stringency Index':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].stringency;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].stringency;
        break;
    }
    return [
      charts.Series<dynamic, int>(
        id: comparisonOfAccumulatedCases.countries[selectedCountry].name,
        colorFn: (_, __) => ChartColors.blue,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: listForeign,
      ),
      charts.Series<dynamic, int>(
        id: comparisonOfAccumulatedCases.countries[Constants.countryCuba].name,
        colorFn: (_, __) => ChartColors.red,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: listCuba,
      ),
    ];
  }

  List<charts.Series<dynamic, int>> getZoomSeries() {
    List<dynamic> listCuba;
    List<dynamic> listForeign;
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
      case 'Stringency Index':
        listCuba = comparisonOfAccumulatedCases
            .countries[Constants.countryCuba].stringency;
        listForeign =
            comparisonOfAccumulatedCases.countries[selectedCountry].stringency;
        break;
    }
    return [
      charts.Series<dynamic, int>(
        id: comparisonOfAccumulatedCases.countries[selectedCountry].name,
        colorFn: (_, __) => ChartColors.blue,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: listForeign
            .take(
              min(listForeign.length, listCuba.length),
            )
            .toList(),
      ),
      charts.Series<dynamic, int>(
        id: comparisonOfAccumulatedCases.countries[Constants.countryCuba].name,
        colorFn: (_, __) => ChartColors.red,
        domainFn: (_, i) => i,
        measureFn: (item, _) => item,
        data: listCuba,
      ),
    ];
  }

  Widget _buildSelectedCountry(String iso3code) => Column(
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
                comparisonOfAccumulatedCases.countries[selectedCountry].name,
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
                selectedCountry = country.iso3Code;
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
    selectedCountry = PrefService.getString(Constants.prefCompareCountry) ??
        Constants.defaultCompareCountry;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Comparación de Cuba',
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
          margin: EdgeInsets.only(left: 35, right: 35),
          child: ListTile(
            onTap: _openCountryPickerDialog,
            title: _buildSelectedCountry(selectedCountry),
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
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20,
          ),
          child: Center(
            child: Linkify(
              text: getFooter(),
              options: LinkifyOptions(humanize: true),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 12,
              ),
              linkStyle: TextStyle(
                color: Constants.primaryColor,
                fontSize: 12,
              ),
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  dev.log('Could not launch $link');
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
