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

  const ErrorJTNewsState({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
