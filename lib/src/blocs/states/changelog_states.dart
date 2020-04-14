import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:covid19cuba/src/models/models.dart';

abstract class ChangelogState extends Equatable {
  const ChangelogState();

  @override
  List<Object> get props => [];
}

class InitialChangelogState extends ChangelogState {}

class LoadingChangelogState extends ChangelogState {}

class LoadedChangelogState extends ChangelogState {
  final ChangelogModel data;

  const LoadedChangelogState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class ErrorChangelogState extends ChangelogState {
  final String errorMessage;

  const ErrorChangelogState({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
