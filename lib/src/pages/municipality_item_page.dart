// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflutter/getflutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/error_widget.dart' as ew;
import 'package:covid19cuba/src/widgets/widgets.dart';

class MunicipalityItemPage extends StatefulWidget {
  final String municipality;

  MunicipalityItemPage({this.municipality}) : assert(municipality != null);

  @override
  State<StatefulWidget> createState() {
    return MunicipalityItemPageState(
      municipality: municipality,
    );
  }
}

class MunicipalityItemPageState extends State<MunicipalityItemPage> {
  final String municipality;

  Completer<void> refreshCompleter;

  MunicipalityItemPageState({this.municipality}) : assert(municipality != null);

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is LoadedHomeState) {
              refreshCompleter?.complete();
              refreshCompleter = Completer();
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Scaffold(
                appBar: getAppBar(context, state),
                body: getBody(context, state),
              );
            },
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
      return getError();
    }
  }

  Widget getAppBar(BuildContext context, HomeState state) {
    return AppBar(
      centerTitle: true,
      title: Text(Constants.municipalitiesCodes[municipality]),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(FetchHomeEvent());
          },
        ),
      ],
    );
  }

  Widget getBody(BuildContext context, HomeState state) {
    if (state is InitialHomeState) {
      BlocProvider.of<HomeBloc>(context).add(
        LoadHomeEvent(showNotification: false),
      );
    }
    if (state is LoadingHomeState) {
      return LoadingWidget();
    }
    if (state is LoadedHomeState) {
      return Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<HomeBloc>(context).add(
              RefreshHomeEvent(),
            );
            return refreshCompleter.future;
          },
          child: MunicipalityWidget(
            data: state.data.getMunicipality(municipality).all,
          ),
        ),
      );
    }
    if (state is ErrorHomeState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        onPressed: () {
          BlocProvider.of<HomeBloc>(context).add(FetchHomeEvent());
        },
        onPressedCache: () {
          BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent(
            showNotification: false,
          ));
        },
        cache: state.cache,
      );
    }
    return Container();
  }

  Widget getError() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.appName),
      ),
      drawer: HomeDrawerWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30),
            child: Icon(
              Icons.error_outline,
              color: Constants.primaryColor,
              size: 150,
            ),
          ),
          Text(
            'Ha ocurrido un error',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'El equipo de desarrollo de la aplicación le pide disculpas '
                'y le invita al grupo de Telegram para que reporte el '
                'problema y así poder solucionarlo ayudando a los restantes '
                'usuarios. Gracias de antemano.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: GFButton(
              text: 'Grupo de soporte en Telegram',
              textColor: Constants.primaryColor,
              color: Constants.primaryColor,
              size: GFSize.LARGE,
              shape: GFButtonShape.pills,
              type: GFButtonType.outline2x,
              fullWidthButton: true,
              onPressed: () async {
                const url = 'https://t.me/covid19cubadatachat';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  log('Could not launch $url');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
