// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

abstract class BulletinsEvent extends Equatable {
  const BulletinsEvent();

  @override
  List<Object> get props => [];
}

class FetchBulletinsEvent extends BulletinsEvent {
  const FetchBulletinsEvent();
}

class RefreshBulletinsEvent extends BulletinsEvent {
  const RefreshBulletinsEvent();
}


