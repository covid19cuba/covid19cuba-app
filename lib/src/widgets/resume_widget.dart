import 'package:flutter/material.dart';

import 'package:covid19cuba/src/models/data_model.dart';

class ResumeWidget extends StatelessWidget {
  final DataModel data;

  const ResumeWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    var months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    var features = <String, int>{
      'Diagnosticados': data.numberOfDiagnosed,
      'Activos': data.numberOfActive,
      'Recuperados': data.numberOfRecovered,
      'Evacuados': data.numberOfEvacuees,
      'Muertes': data.numberOfDeaths,
    };
    var borderSide = BorderSide(
      color: Colors.white,
      width: 2,
    );
    return Column(
      children: <Widget>[
        Table(
          border: TableBorder(
            top: borderSide,
            horizontalInside: borderSide,
            bottom: borderSide,
          ),
          children: features.keys.map((key) {
            return TableRow(
              children: [
                TableCell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        key,
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
                        '${features[key]}',
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
                        'Actualización del ${data.update.day} de ${months[data.update.month - 1]} del ${data.update.year}',
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
      ],
    );
  }
}
