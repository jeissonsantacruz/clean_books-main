part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class ValidatingUserState extends State {
  const ValidatingUserState(Model model) : super(model);
}

class ValidatedUserState extends State {
  const ValidatedUserState(Model model) : super(model);
}

class ErrorState extends State {
  final String error;
  const ErrorState(Model model, {required this.error}) : super(model);

  @override
  List<Object> get props => [error];
}

class FailureDownloadingState extends State {
  final String error;
  const FailureDownloadingState({
    required Model model,
    required this.error,
  }) : super(model);

  @override
  List<Object> get props => [error, model];
}

/// Dta model that contains all data of bloc
class Model extends Equatable {
  final User? user;

  const Model({
    this.user,
  });

  Model copyWith({User? user}) => Model(
        user: user ?? this.user,
      );

  @override
  List<dynamic> get props => [user];
}
