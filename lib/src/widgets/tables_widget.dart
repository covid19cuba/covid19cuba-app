import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class TableData extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final List<String> keys;
  final List<String> values;

  const TableData({
    this.title,
    this.subtitle,
    this.description,
    this.keys,
    this.values,
  })  : assert(title != null),
        assert(subtitle != null),
        assert(description != null),
        assert(keys != null),
        assert(values != null);

  List<TableRow> getTable() {
    var index = 0;
    return keys.map(
      (item) {
        index += 1;
        return TableRow(
          children: [
            TableCell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  '$index',
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(10),
                child: Text(
                  '${keys[index - 1]}',
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    '${values[index - 1]}',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ).toList();
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
      0: FlexColumnWidth(0.3),
      1: FlexColumnWidth(1),
      2: FlexColumnWidth(1),
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
                        margin: EdgeInsets.all(10),
                        child: Text(
                          '#',
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            description,
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ] +
              topData,
        ),
      ],
    );
  }
}
