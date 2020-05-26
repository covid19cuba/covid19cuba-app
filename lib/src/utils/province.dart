// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

class Province {
  String name;
  String image;
  List<String> phoneNumbers;

  Province({
    @required this.name,
    @required this.image,
    @required this.phoneNumbers,
  });
}
