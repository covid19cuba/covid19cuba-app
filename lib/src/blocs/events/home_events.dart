// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeEvent extends HomeEvent {
  final bool showNotification;

  const LoadHomeEvent({this.showNotification = true});
}

class FetchHomeEvent extends HomeEvent {
  const FetchHomeEvent();
}

class RefreshHomeEvent extends HomeEvent {
  const RefreshHomeEvent();
}
