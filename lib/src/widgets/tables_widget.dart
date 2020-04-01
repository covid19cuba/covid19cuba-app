import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/data_model.dart';

class TableData extends StatelessWidget {
  final DataModel data;

  final String info_to_show;

  const TableData({this.data, this.info_to_show})
      : assert(data != null),
      assert(info_to_show != null);

  @override
  Widget build(BuildContext context) {
    var borderSide = BorderSide(
      color: Colors.white,
      width: 2,
    );
    List<Map<String, dynamic>> topdata = List<Map<String, dynamic>>();
    String title = '';
    if(info_to_show=='Provincia'){
      topdata=data.top10Province;
      title='Provincias';
    }
    if(info_to_show=='Municipio'){
      topdata=data.top10Municipality;
      title='Municipios';
    }
    Map<int, TableColumnWidth> col = {
      0: FlexColumnWidth(0.2),
      1: FlexColumnWidth(1),
      2: FlexColumnWidth(1),
    };

    return Column(
      children: <Widget>[
        Table(
          border: TableBorder(
            top: BorderSide(
              color: Colors.white,
              width: 4,
            ),
            horizontalInside: borderSide,
            bottom: borderSide,
          ),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        'TOP10 ${title} ${info_to_show == 'Municipio' ? "Afectados" : "Afectadas"}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
          border: TableBorder(
            top: borderSide,
            horizontalInside: borderSide,
            bottom: borderSide,
          ),
          children: topdata.map((key) {
            return TableRow(
              children: [
                 TableCell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      '${key['index']}',
                      style: TextStyle(
                        color: Colors.white,
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
                      '${key[info_to_show]}${info_to_show == 'Municipio' ? "("+key['Provincia']+")" : ""}',
                      style: TextStyle(
                        color: Colors.white,
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
                        '${(key['casos']/key['total']*100).toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
