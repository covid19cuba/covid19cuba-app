// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';

class UsefulPhonesPage extends StatelessWidget {
  final provinceList = getProvinceList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Atención a la Población'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Table(
            children: _getRowsList(context),
          ),
        ),
      ),
    );
  }

  List<TableRow> _getRowsList(BuildContext context) {
    final List<TableRow> rowsList = new List();
    for (int i = 0; i < provinceList.length; i += 2) {
      rowsList.add(TableRow(children: [
        _createTableItem(context, provinceList[i]),
        _createTableItem(context, provinceList[i + 1])
      ]));
    }
    return rowsList;
  }

  Widget _createTableItem(BuildContext context, Province province) {
    final tableItem = Container(
      height: 100,
      margin: EdgeInsets.all(5),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: province.name,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text(
                province.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    return GestureDetector(
      child: tableItem,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PhoneDetailsPage(province: province),
          ),
        );
      },
    );
  }
}
