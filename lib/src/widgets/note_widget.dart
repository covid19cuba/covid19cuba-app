import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  final String note;

  NoteWidget({this.note});

  @override
  Widget build(BuildContext context) {
    if (note == null || note.isEmpty) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        note,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
