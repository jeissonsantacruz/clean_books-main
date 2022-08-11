import 'package:clean_books/data/datasources/book_detail/books_remote_datasource.dart';
import 'package:clean_books/data/datasources/login/user_local_data_source.dart';
import 'package:clean_books/data/repository/books_repository_impl.dart';
import 'package:clean_books/data/repository/users_repository_impl.dart';
import 'package:clean_books/domain/repositories/books_repository.dart';
import 'package:clean_books/domain/repositories/users_repository.dart';
import 'package:clean_books/domain/usecases/book_detail/get_random_book.dart';
import 'package:clean_books/domain/usecases/login/validate_user_use_case.dart';
import 'package:clean_books/presentation/views/login/bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initBookDetail();
}

Future<void> initBookDetail() async {
  //! Features - BookDetail
  // Blocs
  sl
    ..registerFactory(() => LoginBloc(sl()))

    // use cases
    ..registerLazySingleton(() => GetRandomBook(sl()))
    ..registerLazySingleton(() => ValidateUserUseCase(sl()))

    // Repository
    ..registerLazySingleton<BooksRepository>(() => BooksRepositpryImpl(sl()))
    ..registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(sl()))

    // Data sources
    ..registerLazySingleton<BooksRemoteDataSource>(
        () => BooksRemoteDataSourceImpl(sl()))
    ..registerLazySingleton<UserLocalDataSource>(
        () => UserLocalDataSourceImpl())

    //! External
    ..registerLazySingleton(() => http.Client());
}
