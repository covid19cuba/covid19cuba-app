// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:covid19cuba/src/models/models.dart';

abstract class BulletinsState extends Equatable {
  const BulletinsState();

  @override
  List<Object> get props => [];
}

class InitialBulletinsState extends BulletinsState {
  const InitialBulletinsState();
}

class LoadingBulletinsState extends BulletinsState {
  const LoadingBulletinsState();
}

class LoadedBulletinsState extends BulletinsState {
  final Bulletins data;

  const LoadedBulletinsState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class ErrorBulletinsState extends BulletinsState {
  final String errorMessage;

  const ErrorBulletinsState({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
