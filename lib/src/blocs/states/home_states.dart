// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  final Data data;

  const LoadedHomeState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class ErrorHomeState extends HomeState {
  final String errorMessage;
  final bool cache;

  const ErrorHomeState({@required this.errorMessage, @required this.cache})
      : assert(errorMessage != null, cache != null);

  @override
  List<Object> get props => [errorMessage];
}
