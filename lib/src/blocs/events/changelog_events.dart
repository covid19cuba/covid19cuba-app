import 'package:equatable/equatable.dart';

abstract class ChangelogEvent extends Equatable {
  const ChangelogEvent();

  @override
  List<Object> get props => [];
}

class FetchChangelogEvent extends ChangelogEvent {
  const FetchChangelogEvent();
}

class RefreshChangelogEvent extends ChangelogEvent {
  const RefreshChangelogEvent();
}
