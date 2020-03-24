import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:covid19cuba/src/widgets/error_widget.dart' as ew;

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
          centerTitle: true,
          title: Text(Constants.appName),
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
                return LoadingWidget();
              }
              if (state is LoadedHomeState) {
                var data = state.data;
                return ListView(
                  children: <Widget>[
                    Container(
                      color: Constants.primaryColor,
                      child: ResumeWidget(data: data),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Card(
                        child: EvolutionWidget(data: data),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Card(
                        child: DistributionNationalityDiagnosedWidget(
                          data: data,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Card(
                        child: DistributionAgeGroupsDiagnosedWidget(
                          data: data,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Card(
                        child: PieContagionWidget(data: data),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Card(
                        child: PieContagionWidget(data: data),
                      ),
                    ),
                    Container(padding: EdgeInsets.all(5)),
                  ],
                );
              }
              if (state is ErrorHomeState) {
                return ew.ErrorWidget(errorMessage: state.errorMessage);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
