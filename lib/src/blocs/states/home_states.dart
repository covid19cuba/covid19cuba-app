import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:covid19cuba/src/models/models.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  final DataModel data;
  final WorldTotalsModel countries;
  final ConfigurationModel config;

  const LoadedHomeState({@required this.data, @required this.countries, @required this.config})
      : assert(data != null),
        assert(countries != null),
        assert(config != null);

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
