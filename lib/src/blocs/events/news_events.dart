// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsEvent extends NewsEvent {
  final bool showNotification;

  const LoadNewsEvent({this.showNotification = true});
}

class FetchNewsEvent extends NewsEvent {
  const FetchNewsEvent();
}

class RefreshNewsEvent extends NewsEvent {
  const RefreshNewsEvent();
}
