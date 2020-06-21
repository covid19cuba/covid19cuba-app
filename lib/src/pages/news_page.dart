// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/error_widget.dart' as ew;
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:getflutter/getflutter.dart';
import 'package:preferences/preference_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Completer<void> refreshCompleter = Completer<void>();
    try {
      return BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is LoadedNewsState) {
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

  Widget getBody(BuildContext context, NewsState state,
      Completer<void> refreshCompleter) {
    if (state is InitialNewsState) {
      BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
    }
    if (state is LoadingNewsState) {
      return LoadingWidget();
    }
    if (state is LoadedNewsState) {
      PrefService.setBool(Constants.prefBadgeNews, false);
      return Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<NewsBloc>(context).add(
              RefreshNewsEvent(),
            );
            return refreshCompleter.future;
          },
          child: ListView(
            children: [
                  if (shouldBe()) getWidget(context),
                ] +
                state.data.news.map((item) {
                  return Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
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
                                      item.source,
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
                                      builder: (context) =>
                                          NewsPageMore(item),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: 20, right: 20),
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
    if (state is ErrorNewsState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        onPressed: () {
          BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
        },
        onPressedCache: () {
          BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent(
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
