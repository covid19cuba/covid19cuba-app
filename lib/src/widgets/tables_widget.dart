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
    List<Map<String, dynamic>> topData = List<Map<String, dynamic>>();
    String title = '';
    if (infoToShow == 'Provincia') {
      topData = data.top10Province;
      title = 'Provincias';
    }
    if (infoToShow == 'Municipio') {
      topData = data.top10Municipality;
      title = 'Municipios';
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
                        'TOP10 $title ${infoToShow == 'Municipio' ? "Afectados" : "Afectadas"}',
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
          children: [TableRow(
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
                    infoToShow,
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
          )] + topData.map((key) {
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
                      '${key[infoToShow]} ${infoToShow == 'Municipio' ? "(" + key['Provincia'] + ")" : ""}',
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
                        '${(key['casos'] / key['total'] * 100).toStringAsFixed(2)}%',
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
          }).toList(),
        ),
      ],
    );
  }
}
