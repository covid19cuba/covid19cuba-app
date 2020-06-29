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
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.all(5),
              child: ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(
                    color: Constants.primaryColor,
                  ),
                ),
                subtitle: Text(
                  'Formato: ${item.format}',
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
              final url = item.link;
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
    return result;
  }
}
