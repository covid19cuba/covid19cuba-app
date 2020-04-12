import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:covid19cuba/src/models/models.dart';

abstract class ProvinceState extends Equatable {
  const ProvinceState();

  @override
  List<Object> get props => [];
}

class InitialProvinceState extends ProvinceState {}

class LoadingProvinceState extends ProvinceState {}

class LoadedProvinceState extends ProvinceState {
  final ProvinceModel data;

  const LoadedProvinceState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class ErrorProvinceState extends ProvinceState {
  final String errorMessage;

  const ErrorProvinceState({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
