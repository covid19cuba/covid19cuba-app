// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class ProvinceListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProvinceListPageState();
}

class ProvinceListPageState extends State<ProvinceListPage> {
  var controller = TextEditingController();
  String filter;

  @override
  initState() {
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: 'Buscar ...',
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          controller: controller,
          autofocus: false,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              if (filter != null &&
                  !Constants.provinceAbbreviations.values
                      .toList()[index]
                      .toLowerCase()
                      .contains(filter.toLowerCase())) {
                return Container();
              }
              var p = 10.0;
              return FlatButton(
                child: Container(
                  padding: index == 0
                      ? EdgeInsets.only(
                          left: p, right: p, bottom: p, top: p * 2)
                      : index == Constants.provinceAbbreviations.length - 1
                          ? EdgeInsets.only(
                              left: p,
                              right: p,
                              bottom: p * 2,
                              top: p,
                            )
                          : EdgeInsets.all(p),
                  child: Text(
                    Constants.provinceAbbreviations.values.toList()[index],
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    var province =
                        Constants.provinceAbbreviations.keys.toList()[index];
                    if (province == null) {
                      Navigator.pop(context);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProvinceItemPage(
                            province: province,
                          ),
                        ),
                      );
                    }
                  });
                },
              );
            },
            separatorBuilder: (context, index) {
              if (filter != null &&
                  !Constants.provinceAbbreviations.values
                      .toList()[index]
                      .toLowerCase()
                      .contains(filter.toLowerCase())) {
                return Container();
              }
              return Divider(
                color: Constants.primaryColor,
              );
            },
            itemCount: Constants.provinceAbbreviations.length,
          ),
        )
      ],
    );
  }
}
