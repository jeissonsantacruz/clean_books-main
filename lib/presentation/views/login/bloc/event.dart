part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class InitEvent extends Event {}

/// Event to search
class ChangeNameEvent extends Event {
  final String name;
  ChangeNameEvent({required this.name});
}

/// Event to select a filter
class ChangePasswordEvent extends Event {
  final String password;
  ChangePasswordEvent({required this.password});
}

/// Event to see a external detail of book
class SubmitUserEvent extends Event {
  SubmitUserEvent();
}
