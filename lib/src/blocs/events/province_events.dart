import 'package:equatable/equatable.dart';

abstract class ProvinceEvent extends Equatable {
  const ProvinceEvent();

  @override
  List<Object> get props => [];
}

class FetchProvinceEvent extends ProvinceEvent {
  final String province;

  const FetchProvinceEvent({this.province});

  @override
  List<Object> get props => [province];
}

class RefreshProvinceEvent extends ProvinceEvent {
  final String province;

  const RefreshProvinceEvent({this.province});

  @override
  List<Object> get props => [province];
}
