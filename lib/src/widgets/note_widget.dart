import 'package:flutter/material.dart';

import 'package:covid19cuba/src/models/models.dart';

class NoteWidget extends StatelessWidget {
  final DataModel data;

  NoteWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    if (data.note == null) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        data.note,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
