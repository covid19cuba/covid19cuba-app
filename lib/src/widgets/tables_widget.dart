import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/data_model.dart';

class TableData extends StatelessWidget {
  final DataModel data;

  final String infoToShow;

  const TableData({this.data, this.infoToShow})
      : assert(data != null),
        assert(infoToShow != null);

  @override
  Widget build(BuildContext context) {
    var borderSide = BorderSide(
      color: Constants.primaryColor,
      width: 1,
    );
    var title = infoToShow == 'municipality' ? 'Municipios' : 'Provincias';
    var topData = infoToShow == 'municipality'
        ? data.top10Municipality
        : data.top10Province;
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
                        'TOP${topData.length} $title ${infoToShow == 'municipality' ? "Afectados" : "Afectadas"}',
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
                          title,
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
                            '% del total de casos',
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
              topData.map(
                (key) {
                  return TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            '${key['index']}',
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
                            '${key[infoToShow]} '
                            '${infoToShow == 'municipality' ? '(${key['province']})' : ''}',
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
                              (key['cases'] * 100 / key['total'])
                                      .toStringAsFixed(2) +
                                  '%',
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
              ).toList(),
        ),
      ],
    );
  }
}
