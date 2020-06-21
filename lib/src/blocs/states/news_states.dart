// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:covid19cuba/src/models/models.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class InitialNewsState extends NewsState {}

class LoadingNewsState extends NewsState {}

class LoadedNewsState extends NewsState {
  final NewsModel data;

  const LoadedNewsState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class ErrorNewsState extends NewsState {
  final String errorMessage;
  final bool cache;

  const ErrorNewsState({@required this.errorMessage, @required this.cache})
      : assert(errorMessage != null, cache != null);

  @override
  List<Object> get props => [errorMessage];
}
