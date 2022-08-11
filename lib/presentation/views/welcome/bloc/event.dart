part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class InitEvent extends Event {}

/// Event to search
class ShowDialogEvent extends Event {
  ShowDialogEvent();
}
