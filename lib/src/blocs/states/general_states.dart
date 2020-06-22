// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:meta/meta.dart';

abstract class GeneralState<T> {
  const GeneralState();
}

class InitialGeneralState extends GeneralState {}

class LoadingGeneralState extends GeneralState {}

class LoadedGeneralState<T> extends GeneralState {
  final T data;

  const LoadedGeneralState({@required this.data}) : assert(data != null);
}

class ErrorGeneralState extends GeneralState {
  final String errorMessage;
  final bool cache;

  const ErrorGeneralState({@required this.errorMessage, @required this.cache})
      : assert(errorMessage != null, cache != null);
}
