// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isDark;

  LoadingWidget({this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Constants.primaryColor : Colors.white,
      ),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
