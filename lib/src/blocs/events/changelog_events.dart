// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

abstract class ChangelogEvent extends Equatable {
  const ChangelogEvent();

  @override
  List<Object> get props => [];
}

class FetchChangelogEvent extends ChangelogEvent {
  const FetchChangelogEvent();
}

class RefreshChangelogEvent extends ChangelogEvent {
  const RefreshChangelogEvent();
}
