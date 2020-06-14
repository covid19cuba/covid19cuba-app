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

class WorldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Completer<void> refreshCompleter = Completer<void>();
    try {
      return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is LoadedHomeState) {
            refreshCompleter?.complete();
            refreshCompleter = Completer();
          }
        },
        builder: (context, state) {
          return getBody(context, state, refreshCompleter);
        },
      );
    } catch (e) {
      log(e.toString());
      return getError();
    }
  }

  Widget getBody(
      BuildContext context, HomeState state, Completer<void> refreshCompleter) {
    if (state is InitialHomeState) {
      BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent());
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
          child: WorldWidget(data: state.data),
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
    return ListView(
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
    );
  }
}
