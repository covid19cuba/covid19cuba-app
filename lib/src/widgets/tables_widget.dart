// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class TableData extends StatelessWidget {
  final String title;
  final List<String> headers;
  final List<List<String>> values;

  const TableData({
    this.title,
    this.headers,
    this.values,
  })  : assert(title != null),
        assert(headers != null),
        assert(values != null);

  List<TableRow> getTable() {
    var tableRows = List<TableRow>();
    for (var i = 0; i < values[0].length; ++i) {
      var tableCells = List<TableCell>();
      tableCells.add(TableCell(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Text(
            '${i + 1}',
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.normal,
              fontSize: 11,
            ),
          ),
        ),
      ));
      for (var j = 0; j < values.length; ++j) {
        tableCells.add(TableCell(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(5),
            child: Text(
              '${values[j][i]}',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 11,
              ),
            ),
          ),
        ));
      }
      tableRows.add(TableRow(children: tableCells));
    }
    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    var borderSide = BorderSide(
      color: Constants.primaryColor,
      width: 1,
    );
    var topData = getTable();
    if (topData == null || topData.length == 0) {
      return Container();
    }
    Map<int, TableColumnWidth> col = {
      0: FlexColumnWidth(0.4),
      1: FlexColumnWidth(2),
    };
    return Column(
      children: <Widget>[
        Table(
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Table(
          columnWidths: col,
          border: TableBorder(horizontalInside: borderSide),
          children: [
                TableRow(
                  children: [
                        TableCell(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              '#',
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ] +
                      headers
                          .map(
                            (x) => TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  x,
                                  style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                )
              ] +
              topData,
        ),
        Container(height: 10),
      ],
    );
  }
}
