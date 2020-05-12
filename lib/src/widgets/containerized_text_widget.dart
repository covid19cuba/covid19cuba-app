// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ContainerizedText extends StatelessWidget {
  const ContainerizedText(
      {@required this.text,
      @required this.align,
      @required this.style,
      this.leftMargin: 0,
      this.rightMargin: 0,
      this.topMargin: 0,
      this.bottomMargin: 0});

  final String text;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final TextAlign align;
  final TextStyle style;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        margin: EdgeInsets.only(
          left: leftMargin,
          right: rightMargin,
          top: topMargin,
          bottom: bottomMargin,
        ),
        child: Text(
          this.text,
          textAlign: this.align,
          style: this.style,
        ));
  }
}
