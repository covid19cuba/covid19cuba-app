// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/bulletins/bulletins.dart';
import 'package:covid19cuba/src/models/bulletins/bulletins_state.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class BulletinsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralBloc.getBulletinsBloc(),
      child: BulletinsPageWidget(),
    );
  }
}

class BulletinsPageWidget extends PageWidget<Bulletins, BulletinsState> {
  BulletinsPageWidget() : super(getWidgetLoaded, title: 'Boletines');

  static Widget getWidgetLoaded(
    BuildContext context,
    LoadedGeneralState<Bulletins> state,
  ) {
    return ListView(
      children: loadBulletins(state.data),
    );
  }

  static List<Widget> loadBulletins(Bulletins sources) {
    var result = List<Widget>();
    for (var provider in sources.sources) {
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
            child: Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            bulletin.info,
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Tamaño: ${bulletin.size.toStringAsFixed(2)} Mb',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Constants.primaryColor,
                    ),
                    onPressed: () {
                      var subject = bulletin.info;
                      var text = """${bulletin.info}

Tamaño: ${bulletin.size.toStringAsFixed(2)} Mb

Enlace de descarga: ${provider.dataSource + bulletin.url}

Compartido por Covid19 Cuba Data (https://covid19cubadata.github.io)
""";
                      Share.share(text, subject: subject);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.file_download,
                      color: Constants.primaryColor,
                    ),
                    onPressed: () async {
                      final url = provider.dataSource + bulletin.url;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        log('Could not launch $url');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    return result;
  }
}
