import 'package:flutter/material.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class ResumeWidget extends StatelessWidget {
  final List<Item> resume;
  final DateTime updated;

  const ResumeWidget({
    this.resume,
    this.updated,
  }) : assert(resume != null, updated != null);

  @override
  Widget build(BuildContext context) {
    var borderSide = BorderSide(
      color: Colors.white,
      width: 2,
    );
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
                        'Actualización del ${updated.toStrPlus()}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Table(
          columnWidths: {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1),
          },
          border: TableBorder(
            top: borderSide,
            horizontalInside: borderSide,
            bottom: borderSide,
          ),
          children: resume.map((item) {
            return TableRow(
              children: [
                TableCell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        item.value.toString(),
                        textAlign: TextAlign.center,
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
