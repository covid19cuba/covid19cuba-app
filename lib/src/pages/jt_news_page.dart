// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:getflutter/getflutter.dart';
import 'package:preferences/preference_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/error_widget.dart' as ew;
import 'package:covid19cuba/src/widgets/widgets.dart';

class JTNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JTNewsPageState();
}

class JTNewsPageState extends State<JTNewsPage> {
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
        create: (context) => JTNewsBloc(),
        child: BlocConsumer<JTNewsBloc, JTNewsState>(
          listener: (context, state) {
            if (state is LoadedJTNewsState) {
              refreshCompleter?.complete();
              refreshCompleter = Completer();
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: getAppBar(context, state),
              drawer: getHomeDrawer(context, state),
              body: getBody(context, state),
            );
          },
        ),
      );
    } catch (e) {
      log(e.toString());
      return getError();
    }
  }

  Widget getAppBar(BuildContext context, JTNewsState state) {
    return AppBar(
      centerTitle: true,
      title: Text(Constants.appName),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<JTNewsBloc>(context).add(
              FetchJTNewsEvent(),
            );
          },
        ),
      ],
    );
  }

  Widget getHomeDrawer(BuildContext context, JTNewsState state) {
    return HomeDrawerWidget();
  }

  Widget getBody(BuildContext context, JTNewsState state) {
    if (state is InitialJTNewsState) {
      BlocProvider.of<JTNewsBloc>(context).add(LoadJTNewsEvent());
    }
    if (state is LoadingJTNewsState) {
      return LoadingWidget();
    }
    if (state is LoadedJTNewsState) {
      PrefService.setBool(Constants.prefBadgeNews, false);
      return Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<JTNewsBloc>(context).add(
              RefreshJTNewsEvent(),
            );
            return refreshCompleter.future;
          },
          child: ListView(
            children: state.data.news.map((item) {
              return Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            item.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (await canLaunch(item.link)) {
                            await launch(item.link);
                          } else {
                            log('Could not launch $item.link');
                          }
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Fuente: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'Juventud Técnica',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Autor: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  item.author,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Publicación: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  item.getPublished().toStrPlus(time: true),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Actualización: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  item.getUpdated().toStrPlus(time: true),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Html(
                        data: item.abstract,
                        padding: EdgeInsets.all(10),
                        linkStyle: TextStyle(
                          color: Colors.red,
                        ),
                        onLinkTap: (url) async {
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            log('Could not launch $url');
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => JTNewsPageMore(item),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20, right: 20),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red,
                              ),
                              child: Text(
                                'Leer más',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
    if (state is ErrorJTNewsState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        onPressed: () {
          BlocProvider.of<JTNewsBloc>(context).add(FetchJTNewsEvent());
        },
        onPressedCache: () {
          BlocProvider.of<JTNewsBloc>(context).add(LoadJTNewsEvent(
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
