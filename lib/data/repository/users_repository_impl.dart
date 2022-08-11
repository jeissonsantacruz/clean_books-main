import 'package:clean_books/data/datasources/login/user_local_data_source.dart';
import 'package:clean_books/domain/entities/user.dart';
import 'package:clean_books/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UserLocalDataSource localDataSource;

  UsersRepositoryImpl(this.localDataSource);

  @override
  Future<bool> validateUser(User user) async {
    final bool book = await localDataSource.validateUser(user);
    return book;
  }
}