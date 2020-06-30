// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19cuba/src/models/charts/test_behavior_comparison.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:random_color/random_color.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:preferences/preference_service.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class TestBehaviorComparisonWidget extends StatefulWidget {
  final Map<String, TestBehaviorComparison> testBehaviorComparison;

  TestBehaviorComparisonWidget({this.testBehaviorComparison})
      : assert(testBehaviorComparison != null);

  @override
  TestBehaviorComparisonWidgetState createState() =>
      TestBehaviorComparisonWidgetState(
        testBehaviorComparison: testBehaviorComparison,
      );
}

class TestBehaviorComparisonWidgetState
    extends State<TestBehaviorComparisonWidget> {
  final Map<String, TestBehaviorComparison> testBehaviorComparison;
  var colors = List<charts.Color>();
  var colorGen = RandomColor(0);

  List<DropdownMenuItem<String>> items;
  List<int> selectedItems;
  List<int> defaultItems;

  TestBehaviorComparisonWidgetState({this.testBehaviorComparison}) {
    assert(testBehaviorComparison != null);
    colors = testBehaviorComparison.entries.map((x) {
      return colorGen.randomChartColor();
    }).toList();
    var items = testBehaviorComparison.entries.toList();
    items = items..sort((a, b) => a.value.name.compareTo(b.value.name));
    items = items.where((item) => item.key != 'Cuba').toList();
    this.items = items.map((item) {
      return DropdownMenuItem(
        child: Text(item.value.name),
        value: item.key,
      );
    }).toList();
    var sorted = testBehaviorComparison.entries.toList();
    sorted = sorted..sort((a, b) => b.value.total - a.value.total);
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
                  'Comparación respecto al comportamiento de los Tests '
                  'realizados',
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
                title: 'Comparación respecto al comportamiento de los Tests '
                    'realizados',
                text: 'El gráfico permite comparar a Cuba con distintos países '
                    'respecto, a la vez, el porciento de detección de '
                    'contagiados en base al total de tests realizados y el '
                    'número de tests por millón de habitantes.\n\n'
                    'Datos de los países tomados de Our World in Data.\n'
                    'https://covid.ourworldindata.org/data/owid-covid-data.csv\n'
                    'Los datos de Cuba se calculan a partir de la propia '
                    'información que provee esta aplicación.',
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 600,
          child: charts.ScatterPlotChart(
            selectedItems.map((i) {
                  var key = items[i].value;
                  var value = testBehaviorComparison[key];
                  var localIndex = index++;
                  return charts.Series<TestBehaviorComparison, double>(
                    id: value.name,
                    colorFn: (_, __) => colors[localIndex],
                    domainFn: (x, _) => x.totalTestsPerMillion,
                    measureFn: (x, _) => x.testEffectiveness,
                    radiusPxFn: (_, __) => 5,
                    data: [value],
                  );
                }).toList() +
                [
                  charts.Series<TestBehaviorComparison, double>(
                    id: 'Cuba',
                    colorFn: (_, __) => colors[index],
                    domainFn: (x, _) => x.totalTestsPerMillion,
                    measureFn: (x, _) => x.testEffectiveness,
                    radiusPxFn: (_, __) => 10,
                    data: [testBehaviorComparison['CUB']],
                  )
                ],
            animate: false,
            defaultInteractions: true,
            behaviors: [
              charts.ChartTitle(
                'Tests por millón de habitantes',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 8),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                '% de tests positivos',
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
              if (PrefService.getBool(Constants.prefChartsZoom))
                charts.PanAndZoomBehavior(),
            ],
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
