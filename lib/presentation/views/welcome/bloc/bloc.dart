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
class LoginBloc extends bloc.Bloc<Event, State>
    with BaseViewModel<WelcomeBlocDelegate> {
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
    } else if (event is ShowDialogEvent) {
      yield* _showDialogEvent(event);
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
  Stream<State> _showDialogEvent(ShowDialogEvent event) async* {
    try {
      delegate?.showLoginDialog();
    } catch (error) {
      yield ErrorState(
        state.model,
        error: error.toString(),
      );
    }
  }
}

abstract class WelcomeBlocDelegate {
  Future<void> showLoginDialog();
}

mixin BaseViewModel<T> {
  T? delegate;
}
