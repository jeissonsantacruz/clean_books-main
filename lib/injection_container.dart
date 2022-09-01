import 'package:clean_books/data/repository/users_repository_impl.dart';
import 'package:clean_books/domain/repositories/users_repository.dart';
import 'package:clean_books/domain/usecases/book_detail/get_random_book.dart';
import 'package:clean_books/domain/usecases/login/validate_user_use_case.dart';
import 'package:clean_books/presentation/views/login/bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initDependency();
}

Future<void> initDependency() async {
  //! Features - BookDetail
  // Blocs
  sl
    ..registerFactory(() => LoginBloc(sl()))

    // use cases
    ..registerLazySingleton(() => GetRandomBook(sl()))
    ..registerLazySingleton(() => ValidateUserUseCase(sl()))

    // Repository
    ..registerLazySingleton<UsersRepository>(
        () => UsersRepositoryImpl(sl(), sl()))

    // Data sources

    //! External
    ..registerLazySingleton(() => http.Client());
}
