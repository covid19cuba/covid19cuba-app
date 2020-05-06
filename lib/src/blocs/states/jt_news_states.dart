import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:covid19cuba/src/models/models.dart';

abstract class JTNewsState extends Equatable {
  const JTNewsState();

  @override
  List<Object> get props => [];
}

class InitialJTNewsState extends JTNewsState {}

class LoadingJTNewsState extends JTNewsState {}

class LoadedJTNewsState extends JTNewsState {
  final JTNewsModel data;

  const LoadedJTNewsState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class ErrorJTNewsState extends JTNewsState {
  final String errorMessage;
  final bool cache;

  const ErrorJTNewsState({@required this.errorMessage, @required this.cache})
      : assert(errorMessage != null, cache != null);

  @override
  List<Object> get props => [errorMessage];
}
