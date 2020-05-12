// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

abstract class JTNewsEvent extends Equatable {
  const JTNewsEvent();

  @override
  List<Object> get props => [];
}

class LoadJTNewsEvent extends JTNewsEvent {
  final bool showNotification;

  const LoadJTNewsEvent({this.showNotification = true});
}

class FetchJTNewsEvent extends JTNewsEvent {
  const FetchJTNewsEvent();
}

class RefreshJTNewsEvent extends JTNewsEvent {
  const RefreshJTNewsEvent();
}
