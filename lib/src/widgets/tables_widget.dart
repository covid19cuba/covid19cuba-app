import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/data_model.dart';

class TableData extends StatelessWidget {
  final DataModel data;

  final String infoToShow;

  const TableData({this.data, this.infoToShow})
      : assert(data != null),
        assert(infoToShow != null);

  List<TableRow> getTableMunicipality() {
    var topData = data.affectedMunicipalities?.take(10)?.toList();
    if (topData == null || topData.length == 0) {
      return null;
    }
    var index = 0;
    return topData.map(
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
                  '${item.name} (${item.province})',
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
                    (item.value * 100 / item.total).toStringAsFixed(2) + '%',
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

  List<TableRow> getTableProvince() {
    var topData = data.affectedProvinces?.take(10)?.toList();
    if (topData == null || topData.length == 0) {
      return null;
    }
    var index = 0;
    return topData.map(
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
                  '${item.name}',
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
                    (item.value * 100 / item.total).toStringAsFixed(2) + '%',
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
    var title = infoToShow == 'municipality' ? 'Municipios' : 'Provincias';
    var topData = infoToShow == 'municipality'
        ? getTableMunicipality()
        : getTableProvince();
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
                        'TOP${topData.length} $title '
                        '${infoToShow == 'municipality' ? "Afectados" : "Afectadas"}',
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
              topData,
        ),
      ],
    );
  }
}
