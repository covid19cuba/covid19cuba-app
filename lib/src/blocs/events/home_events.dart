import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeEvent extends HomeEvent {
  const LoadHomeEvent();
}

class FetchHomeEvent extends HomeEvent {
  const FetchHomeEvent();
}
