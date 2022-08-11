import 'package:bloc/bloc.dart' as bloc;
import 'package:clean_books/domain/entities/user.dart';
import 'package:clean_books/domain/usecases/login/validate_user_use_case.dart';
import 'package:clean_books/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

// Class that contains the  bloc of singup user
class LoginBloc extends bloc.Bloc<Event, State> {
  final ValidateUserUseCase validateUserUseCase;
  LoginBloc([ValidateUserUseCase? validateUserUseCase])
      : validateUserUseCase = validateUserUseCase ??= sl<ValidateUserUseCase>(),
        super(initialState);

  static State get initialState => const InitialState(
        Model(),
      );

  @override
  Stream<State> mapEventToState(Event event) async* {
    if (event is InitEvent) {
      yield* _initEvent(event);
    } else if (event is ChangeNameEvent) {
      yield* _changeNameEvent(event);
    } else if (event is ChangePasswordEvent) {
      yield* _changePasswordEvent(event);
    } else if (event is SubmitUserEvent) {
      yield* _submitUserEvent(event);
    }
  }

  // Stream that get the books with a initial search
  Stream<State> _initEvent(InitEvent event) async* {
    try {} catch (error) {
      yield ErrorState(
        state.model,
        error: error.toString(),
      );
    }
  }

  // Stream that get the detail of book
  Stream<State> _changeNameEvent(ChangeNameEvent event) async* {
    try {} catch (error) {
      yield ErrorState(
        state.model,
        error: error.toString(),
      );
    }
  }

  // Stream that change the query to search book
  Stream<State> _changePasswordEvent(ChangePasswordEvent event) async* {
    try {} catch (error) {
      yield ErrorState(
        state.model,
        error: error.toString(),
      );
    }
  }

  // Stream that set a filter
  Stream<State> _submitUserEvent(SubmitUserEvent event) async* {
    try {} catch (error) {
      yield ErrorState(
        state.model,
        error: error.toString(),
      );
    }
  }
}
