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

import 'package:covid19cuba/src/models/models.dart';

class BulletinsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BulletinsPageState();
}

class BulletinsPageState extends State<BulletinsPage> {
  Completer<void> refreshCompleter;

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return BlocProvider(
        create: (context) => BulletinsBloc(),
        child: BlocListener<BulletinsBloc, BulletinsState>(
          listener: (context, state) {
            if (state is LoadedBulletinsState) {
              refreshCompleter?.complete();
              refreshCompleter = Completer();
            }
          },
          child: BlocBuilder<BulletinsBloc, BulletinsState>(
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

  Widget getAppBar(BuildContext context, BulletinsState state) {
    return AppBar(
      centerTitle: true,
      title: Text('Boletines'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<BulletinsBloc>(context).add(
              FetchBulletinsEvent(),
            );
          },
        ),
      ],
    );
  }

  Widget getBody(BuildContext context, BulletinsState state) {
    if (state is InitialBulletinsState) {
      BlocProvider.of<BulletinsBloc>(context).add(
        FetchBulletinsEvent(),
      );
    }
    if (state is LoadingBulletinsState) {
      return LoadingWidget();
    }
    if (state is LoadedBulletinsState) {
      return Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<BulletinsBloc>(context).add(
              RefreshBulletinsEvent(),
            );
            return refreshCompleter.future;
          },
          child: ListView(
            children: loadBulletins(state.data),
          ),
        ),
      );
    }
    if (state is ErrorBulletinsState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        onPressed: () {
          BlocProvider.of<BulletinsBloc>(context).add(FetchBulletinsEvent());
        },
        onPressedCache: () {},
        cache: false,
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

List<Widget> loadBulletins(Bulletins sources) {
  var result = List<Widget>();
  for (var provider in sources.providers) {
    result.add(
      ListTile(
        title: Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Text(
            provider.name,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 24,
            ),
          ),
        ),
        trailing: GestureDetector(
          child: Icon(Icons.open_in_new, color: Constants.primaryColor),
          onTap: () async {
            final url = provider.url;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              log('Could not launch $url');
            }
          },
        ),
      ),
    );
    result.add(
      Divider(
        height: 5,
        thickness: 2.5,
        indent: 10,
        endIndent: 10,
        color: Constants.primaryColor,
      ),
    );
    for (var bulletin in provider.bulletins) {
      result.add(
        Card(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.all(5),
              child: ListTile(
                title: Text(
                  bulletin.info,
                  style: TextStyle(
                    color: Constants.primaryColor,
                  ),
                ),
                subtitle: Text(
                  'Tamaño: ${bulletin.size.toStringAsFixed(2)} Mb',
                  style: TextStyle(
                    color: Constants.primaryColor,
                  ),
                ),
                trailing: Icon(
                  Icons.file_download,
                  color: Constants.primaryColor,
                ),
              ),
            ),
            onTap: () async {
              final url = provider.data_source + bulletin.url;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                log('Could not launch $url');
              }
            },
          ),
        ),
      );
    }
  }
  return result;
}
