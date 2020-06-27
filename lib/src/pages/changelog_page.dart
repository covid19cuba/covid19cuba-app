// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/changelog/changelog.dart';
import 'package:covid19cuba/src/models/changelog/changelog_state.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangelogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralBloc.getChangelogBloc(),
      child: ChangelogPageWidget(),
    );
  }
}

class ChangelogPageWidget extends PageWidget<Changelog, ChangelogState> {
  ChangelogPageWidget() : super(getWidgetLoaded, title: 'Cambios Realizados');

  static Widget getWidgetLoaded(
      BuildContext context,
      LoadedGeneralState<Changelog> state,
      ) {
    return ListView(
      children: state.data.changelog.reversed.map((item) {
        var title = Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Text(
            'Versión ${item.version} - ${item.date.toStrPlus()}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor,
            ),
          ),
        );
        var addedTitle = Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Text(
            'Se agregó:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor,
            ),
          ),
        );
        var added = Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.added.map((x) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '- $x',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Constants.primaryColor,
                  ),
                ),
              );
            }).toList(),
          ),
        );
        var changedTitle = Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Text(
            'Se cambió:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor,
            ),
          ),
        );
        var changed = Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.changed.map((x) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '- $x',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Constants.primaryColor,
                  ),
                ),
              );
            }).toList(),
          ),
        );
        var fixedTitle = Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Text(
            'Se arregló:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor,
            ),
          ),
        );
        var fixed = Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.fixed.map((x) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '- $x',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Constants.primaryColor,
                  ),
                ),
              );
            }).toList(),
          ),
        );
        var deletedTitle = Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Text(
            'Se eliminó:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor,
            ),
          ),
        );
        var deleted = Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.deleted.map((x) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '- $x',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Constants.primaryColor,
                  ),
                ),
              );
            }).toList(),
          ),
        );
        var list = List<Widget>();
        list.add(title);
        if (item.added.length > 0) {
          list.add(addedTitle);
          list.add(added);
        }
        if (item.changed.length > 0) {
          list.add(changedTitle);
          list.add(changed);
        }
        if (item.fixed.length > 0) {
          list.add(fixedTitle);
          list.add(fixed);
        }
        if (item.deleted.length > 0) {
          list.add(deletedTitle);
          list.add(deleted);
        }
        list.add(Container(height: 10));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list,
        );
      }).toList(),
    );
  }
}
