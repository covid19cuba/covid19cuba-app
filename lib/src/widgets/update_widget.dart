// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class UpdateWidget extends StatelessWidget {
  final DateTime updated;

  UpdateWidget({this.updated}) : assert(updated != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.primaryColor,
      child: Table(
        border: TableBorder(
          top: BorderSide(
            color: Colors.white,
            width: 4,
          ),
          horizontalInside: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      'Actualización del '
                      '${updated.toStrPlus()}',
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
    );
  }
}
