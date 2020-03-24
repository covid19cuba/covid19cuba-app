import 'dart:developer' as dev;
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflutter/getflutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/models.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController fadeController;
  Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Covid19 Cuba'),
        ),
        drawer: Drawer(
          elevation: 0,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Image.network(
                          'https://covid19cubadata.github.io/images/logo.jpg',
                        ),
                        padding: EdgeInsets.all(5),
                        width: 100,
                      ),
                      Text(
                        'Covid19 Cuba',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Aplicación para conocer los reportes diarios, estadísticas, '
                  'etc respecto a la Covid-19 en Cuba.',
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Puede contribuir al desarrollo de esta aplicación, pues '
                  'es un proyecto de código abierto.',
                ),
              ),
              ListTile(
                title: Text('Ver el código fuente'),
                leading: Icon(Icons.link),
                onTap: () async {
                  Navigator.pop(context);
                  const url =
                      'https://github.com/Covid19-Cuba-Efforts/covid19cuba-app';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    dev.log('Could not launch $url');
                  }
                },
              ),
            ],
          ),
        ),
        body: FadeTransition(
          opacity: fadeAnimation,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              fadeController.reset();
              fadeController.forward();
              if (state is InitialHomeState) {
                BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent());
              }
              if (state is LoadingHomeState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadedHomeState) {
                var diagnosed = state.data.cases.days.values
                    .where((x) => x.diagnosed != null)
                    .map((x) => x.diagnosed.length)
                    .reduce((v, e) => v + e);
                var deaths = state.data.cases.days.values
                    .where((x) => x.deathsNumber != null)
                    .map((x) => x.deathsNumber)
                    .reduce((v, e) => v + e);
                var evacuees = state.data.cases.days.values
                    .where((x) => x.evacueesNumber != null)
                    .map((x) => x.evacueesNumber)
                    .reduce((v, e) => v + e);
                var active = diagnosed - deaths - evacuees;
                var days = state.data.cases.days.values.toList();
                days.sort((a, b) => a.date.compareTo(b.date));
                var accumulated = List<int>();
                for (var item in days
                    .map((x) => x.diagnosed != null ? x.diagnosed.length : 0)) {
                  if (accumulated.length == 0) {
                    accumulated.add(item);
                  } else {
                    accumulated.add(item + accumulated.last);
                  }
                }
                var allDiagnosed = List<DiagnosedModel>();
                state.data.cases.days.values
                    .where((x) => x.diagnosed != null)
                    .forEach((x) {
                  allDiagnosed.addAll(x.diagnosed);
                });
                var countries = Map<String, int>();
                state.data.cases.days.values
                    .where((x) => x.diagnosed != null)
                    .map((x) => x.diagnosed)
                    .forEach((diagnosed) {
                  diagnosed.forEach((item) {
                    if (countries.containsKey(item.country)) {
                      ++countries[item.country];
                    } else {
                      countries[item.country] = 0;
                    }
                  });
                });
                var ageGroupsNames = [
                  '0-18',
                  '19-40',
                  '41-60',
                  '61 o más',
                  'Desconocido',
                ];
                var ageGroups = [0, 0, 0, 0, 0];
                state.data.cases.days.values
                    .where((x) => x.diagnosed != null)
                    .map((x) => x.diagnosed)
                    .forEach((diagnosed) {
                  diagnosed.forEach((item) {
                    var age = item.age;
                    if (age == null) {
                      ++ageGroups[4];
                    } else if (0 <= age && age <= 18) {
                      ++ageGroups[0];
                    } else if (19 <= age && age <= 40) {
                      ++ageGroups[1];
                    } else if (41 <= age && age <= 60) {
                      ++ageGroups[2];
                    } else {
                      ++ageGroups[3];
                    }
                  });
                });
                var result = <String, int>{
                  'importado': 0,
                  'introducido': 0,
                  'autoctono': 0,
                  'desconocido': 0,
                };
                state.data.cases.days.values
                    .where((x) => x.diagnosed != null)
                    .map((x) => x.diagnosed)
                    .forEach((diagnosed) {
                  diagnosed.forEach((item) {
                    if (item.contagion == null) {
                      ++result['desconocido'];
                    } else if (result.containsKey(item.contagion)) {
                      ++result[item.contagion];
                    } else {
                      result[item.contagion] = 0;
                    }
                  });
                });
                var gender = <String, int>{
                  'hombre': 0,
                  'mujer': 0,
                  'no reportado': 0,
                };
                state.data.cases.days.values
                    .where((x) => x.diagnosed != null)
                    .map((x) => x.diagnosed)
                    .forEach((diagnosed) {
                  diagnosed.forEach((item) {
                    if (item.sex == null) {
                      ++gender['desconocido'];
                    } else if (gender.containsKey(item.sex)) {
                      ++gender[item.sex];
                    } else {
                      gender[item.sex] = 0;
                    }
                  });
                });
                var colorPalettes = charts.MaterialPalette.getOrderedPalettes(
                  max(result.keys.length, gender.keys.length),
                );
                var domains = {
                  'cu': 'Cuba',
                  'it': 'Italia',
                  'be': 'Bélgica',
                  'us': 'USA',
                  'fr': 'Francia',
                  'ca': 'Canadá',
                  'es': 'España',
                  'cn': 'China',
                  'ru': 'Rusia'
                };
                return ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Table(
                        border: TableBorder.all(color: Colors.white),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text('Diagnosticados'),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(diagnosed.toString()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text('Activos'),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(active.toString()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text('Muertes'),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(deaths.toString()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text('Evacuados'),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(evacuees.toString()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 250,
                      child: charts.TimeSeriesChart(
                        [
                          charts.Series<int, DateTime>(
                            id: 'Casos acumulados',
                            colorFn: (_, __) =>
                                charts.MaterialPalette.blue.shadeDefault,
                            domainFn: (int data, int i) => days[i].date,
                            measureFn: (int data, _) => data,
                            data: accumulated,
                          ),
                          charts.Series<DayModel, DateTime>(
                            id: 'Casos diarios',
                            colorFn: (_, __) =>
                                charts.MaterialPalette.blue.shadeDefault,
                            domainFn: (DayModel data, int x) => data.date,
                            measureFn: (DayModel data, _) =>
                                data.diagnosed != null
                                    ? data.diagnosed.length
                                    : 0,
                            data: days,
                          ),
                        ],
                        defaultInteractions: true,
                        defaultRenderer: charts.LineRendererConfig(
                          includePoints: true,
                        ),
                        behaviors: [
                          charts.ChartTitle(
                            'Evolución en el tiempo',
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleStyleSpec: charts.TextStyleSpec(
                              color: charts.MaterialPalette.white,
                            ),
                          ),
                          charts.SeriesLegend(
                            position: charts.BehaviorPosition.bottom,
                          ),
                          charts.LinePointHighlighter(
                            showHorizontalFollowLine:
                                charts.LinePointHighlighterFollowLineType.all,
                            showVerticalFollowLine: charts
                                .LinePointHighlighterFollowLineType.nearest,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 250,
                      child: charts.BarChart(
                        [
                          charts.Series<DiagnosedModel, String>(
                            id: 'Distribución por nacionalidad de casos en Cuba',
                            colorFn: (_, __) =>
                                charts.MaterialPalette.blue.shadeDefault,
                            domainFn: (data, i) => domains[data.country],
                            measureFn: (data, i) => countries[data.country],
                            data: allDiagnosed,
                          ),
                        ],
                        defaultInteractions: true,
                        behaviors: [
                          charts.ChartTitle(
                            'Distribución por nacionalidad',
                            behaviorPosition: charts.BehaviorPosition.top,
                            subTitle: ' de casos en Cuba',
                            subTitleStyleSpec: charts.TextStyleSpec(
                              color: charts.MaterialPalette.white,
                            ),
                            titleStyleSpec: charts.TextStyleSpec(
                              color: charts.MaterialPalette.white,
                            ),
                          ),
                          charts.LinePointHighlighter(
                            showHorizontalFollowLine:
                                charts.LinePointHighlighterFollowLineType.all,
                            showVerticalFollowLine: charts
                                .LinePointHighlighterFollowLineType.nearest,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 250,
                      child: charts.BarChart(
                        [
                          charts.Series<int, String>(
                            id: 'Distribución por rangos etarios',
                            colorFn: (_, __) =>
                                charts.MaterialPalette.blue.shadeDefault,
                            domainFn: (data, i) => ageGroupsNames[i],
                            measureFn: (data, i) => data,
                            data: ageGroups,
                          ),
                        ],
                        defaultInteractions: true,
                        behaviors: [
                          charts.ChartTitle(
                            'Distribución por rangos etarios',
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleStyleSpec: charts.TextStyleSpec(
                              color: charts.MaterialPalette.white,
                            ),
                          ),
                          charts.LinePointHighlighter(
                            showHorizontalFollowLine:
                                charts.LinePointHighlighterFollowLineType.all,
                            showVerticalFollowLine: charts
                                .LinePointHighlighterFollowLineType.nearest,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 300,
                      child: charts.PieChart(
                        [
                          charts.Series<String, String>(
                            id: 'Casos por modo de contagio',
                            colorFn: (_, i) => colorPalettes[i].shadeDefault,
                            domainFn: (data, _) => data,
                            measureFn: (data, _) => result[data],
                            data: result.keys.toList(),
                          ),
                        ],
                        behaviors: [
                          charts.ChartTitle(
                            'Casos por modo de contagio',
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleStyleSpec: charts.TextStyleSpec(
                              color: charts.MaterialPalette.white,
                            ),
                          ),
                          charts.DatumLegend(
                            position: charts.BehaviorPosition.bottom,
                            cellPadding: EdgeInsets.all(10),
                            showMeasures: true,
                            legendDefaultMeasure:
                                charts.LegendDefaultMeasure.firstValue,
                            desiredMaxColumns: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 300,
                      child: charts.PieChart(
                        [
                          charts.Series<String, String>(
                            id: 'Casos por sexo',
                            colorFn: (_, i) => colorPalettes[i].shadeDefault,
                            domainFn: (data, _) => data,
                            measureFn: (data, _) => gender[data],
                            data: gender.keys.toList(),
                          ),
                        ],
                        behaviors: [
                          charts.ChartTitle(
                            'Casos por sexo',
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleStyleSpec: charts.TextStyleSpec(
                              color: charts.MaterialPalette.white,
                            ),
                          ),
                          charts.DatumLegend(
                            position: charts.BehaviorPosition.bottom,
                            cellPadding: EdgeInsets.all(10),
                            showMeasures: true,
                            legendDefaultMeasure:
                                charts.LegendDefaultMeasure.firstValue,
                            desiredMaxColumns: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (state is ErrorHomeState) {
                return ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(30),
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 150,
                      ),
                    ),
                    Text(
                      'Ha ocurrido un error',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          state.errorMessage,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: GFButton(
                        text: 'Intentar actualizar la información',
                        textColor: Colors.white,
                        color: Colors.white,
                        size: GFSize.LARGE,
                        shape: GFButtonShape.pills,
                        type: GFButtonType.outline2x,
                        fullWidthButton: true,
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(FetchHomeEvent());
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: GFButton(
                        text: 'Ver última información obtenida',
                        textColor: Colors.white,
                        color: Colors.white,
                        size: GFSize.LARGE,
                        shape: GFButtonShape.pills,
                        type: GFButtonType.outline2x,
                        fullWidthButton: true,
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(LoadHomeEvent());
                        },
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
