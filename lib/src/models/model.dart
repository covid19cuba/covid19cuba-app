// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

abstract class Model {
  Map<String, dynamic> toJson();
}

abstract class CacheModel extends Model {
  String cache;
}
