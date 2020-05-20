// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:preferences/preference_service.dart';
import 'package:quiver/iterables.dart' show zip;
import 'package:random_color/random_color.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class CurvesEvolutionWidget extends StatefulWidget {
  final Map<String, dynamic> curvesEvolution;
  final DateTime updated;

  CurvesEvolutionWidget({this.curvesEvolution, this.updated})
      : assert(curvesEvolution != null, updated != null);

  @override
  CurvesEvolutionWidgetState createState() => CurvesEvolutionWidgetState(
        curvesEvolution: curvesEvolution,
        updated: updated,
      );
}

class CurvesEvolutionWidgetState extends State<CurvesEvolutionWidget> {
  final Map<String, dynamic> curvesEvolution;
  final DateTime updated;
  var colors = List<charts.Color>();
  var colorGen = RandomColor(0);
  List<DropdownMenuItem<String>> items;
  List<int> selectedItems;
  List<int> defaultItems;

  CurvesEvolutionWidgetState({this.curvesEvolution, this.updated}) {
    assert(curvesEvolution != null);
    assert(updated != null);
    colors = curvesEvolution.entries.map((x) {
      return colorGen.randomChartColor();
    }).toList();
    var items = curvesEvolution.entries.toList();
    items = items..sort((a, b) => a.key.compareTo(b.key));
    items = items.where((item) => item.key != 'Cuba').toList();
    this.items = items.map((item) {
      return DropdownMenuItem(
        child: Text(item.key),
        value: item.key,
      );
    }).toList();
    var sorted = curvesEvolution.entries.toList();
    sorted = sorted..sort((a, b) => b.value['ctotal'] - a.value['ctotal']);
    sorted = sorted.where((item) => item.key != 'Cuba').take(20).toList();
    defaultItems = List<int>();
    for (var item in sorted) {
      for (var i = 0; i < items.length; ++i) {
        if (item.key == items[i].key) {
          defaultItems.add(i);
          break;
        }
      }
    }
    selectedItems = List<int>();
    selectedItems.addAll(defaultItems);
  }

  @override
  Widget build(BuildContext context) {
    var index = 0;
    var show = true;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Evolución de la epidemia (países seleccionados)',
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
                title: 'Evolución de la epidemia (países seleccionados)',
                text: 'El gráfico muestra a partir de 30 casos, en escala '
                    'logarítmica y agrupados cada siete días, los casos '
                    'nuevos por el total de casos confirmados de cada país. '
                    'De esta manera, los países mientras siguen una línea '
                    'recta están en un crecimiento exponencial y cuando '
                    'se desvían de la recta comienzan a salir '
                    'del comportamiento exponencial.\n\n'
                    'Datos de los países tomados '
                    'de\nhttps://github.com/pomber/covid19\ny '
                    'actualizado el '
                    '${updated.toStrPlus()}',
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 750,
          child: charts.LineChart(
            selectedItems.map((i) {
                  var key = items[i].value;
                  var value = curvesEvolution[key];
                  var localIndex = index++;
                  var list = List<double>();
                  for (var x in value['weeks']) {
                    if (x == null) {
                      list.add(null);
                    } else {
                      list.add(double.parse(x.toString()));
                    }
                  }
                  return charts.Series<List, double>(
                    id: key,
                    colorFn: (_, __) => colors[localIndex],
                    domainFn: (item, _) => item[1],
                    measureFn: (item, _) => item[0],
                    data: zip([
                      list,
                      List<double>.from(value['cummulative_sum']),
                    ]).toList(),
                    domainLowerBoundFn: (_, __) => 1.4771212547196624,
                  );
                }).toList() +
                [
                  charts.Series<List, double>(
                    id: 'Cuba',
                    colorFn: (_, __) => colors[index],
                    domainFn: (item, _) => item[1],
                    measureFn: (item, _) => item[0],
                    data: zip([
                      List<double>.from(curvesEvolution['Cuba']['weeks']),
                      List<double>.from(
                          curvesEvolution['Cuba']['cummulative_sum']),
                    ]).toList(),
                    domainLowerBoundFn: (_, __) => 1.4771212547196624,
                  )
                ],
            animate: false,
            defaultInteractions: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
              radiusPx: 3.0,
              strokeWidthPx: 1.5,
            ),
            behaviors: [
              charts.ChartTitle(
                'Casos confirmados (log scale)',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 8),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                'Casos nuevos (log scale)',
                behaviorPosition: charts.BehaviorPosition.start,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 8),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                desiredMaxColumns: 2,
                showMeasures: true,
                cellPadding: EdgeInsets.symmetric(horizontal: 5),
                measureFormatter: (num measure) => measure == null ? '' : '<-',
              ),
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.all,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
              ),
              if (PrefService.getBool(Constants.prefChartsZoom))
                charts.PanAndZoomBehavior(),
            ],
            domainAxis: charts.NumericAxisSpec(
              viewport: charts.NumericExtents(
                  1.45,
                  log(curvesEvolution.values.reduce((curr, next) {
                            return curr['total'] > next['total'] ? curr : next;
                          })['total']) /
                          ln10 +
                      0.1),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SearchableDropdown.multiple(
            items: items,
            selectedItems: selectedItems,
            selectedValueWidgetFn: (item) {
              if (show) {
                show = false;
                return Text('Seleccionar países deseados');
              }
              return Container();
            },
            hint: Padding(
              padding: EdgeInsets.all(3),
              child: Text('Seleccione los países'),
            ),
            searchHint: 'Seleccione los países',
            onChanged: (value) {
              setState(() {
                selectedItems = value;
              });
            },
            closeButton: (sel) => 'Seleccionar',
            doneButton: 'Guardar',
            isExpanded: true,
            isCaseSensitiveSearch: false,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20,
          ),
          child: GFButton(
            text: 'Seleccionar países iniciales',
            textColor: Constants.primaryColor,
            textStyle: TextStyle(
              color: Constants.primaryColor,
            ),
            color: Constants.primaryColor,
            shape: GFButtonShape.pills,
            type: GFButtonType.outline2x,
            borderSide: BorderSide(
              width: 1.0,
              color: Constants.primaryColor,
            ),
            fullWidthButton: true,
            onPressed: () {
              setState(() {
                selectedItems.clear();
                selectedItems.addAll(defaultItems);
              });
            },
          ),
        ),
      ],
    );
  }
}
