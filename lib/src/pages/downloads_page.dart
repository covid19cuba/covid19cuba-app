// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/downloads/downloads.dart';
import 'package:covid19cuba/src/models/downloads/downloads_state.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralBloc.getDownloadsBloc(),
      child: DownloadsPageWidget(),
    );
  }
}

class DownloadsPageWidget extends PageWidget<Downloads, DownloadsState> {
  DownloadsPageWidget() : super(getWidgetLoaded, title: 'Descargas');

  static Widget getWidgetLoaded(
    BuildContext context,
    LoadedGeneralState<Downloads> state,
  ) {
    return ListView(
      children: loadDownloads(state.data),
    );
  }

  static List<Widget> loadDownloads(Downloads data) {
    var result = List<Widget>();
    for (var item in data.downloads) {
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
                          item.name,
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Formato: ${item.format}',
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
                    var subject = item.name;
                    var text = """${item.name}

Formato: ${item.format}

Enlace de descarga: ${item.link}

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
                    final url = item.link;
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
    return result;
  }
}
