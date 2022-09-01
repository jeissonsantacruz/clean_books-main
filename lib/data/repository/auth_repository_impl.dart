import 'package:clean_books/data/datasources/login/user_local_data_source.dart';
import 'package:clean_books/data/datasources/login/user_remote_data_source.dart';
import 'package:clean_books/domain/entities/user.dart';
import 'package:clean_books/domain/repositories/auth_repository.dart';

/// Class that implements the Autentication Repository
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<User> loginUserByGoogle(User user) async {
    final bool isLogged = await localDataSource.validateUser(user);
    if (isLogged) {
      return User();
    } else {
      final User isLogged = await remoteDataSource.validateUser(user);
      localDataSource.saveUser(user);
      return isLogged;
    }
  }

  @override
  Future<bool> logoutUserByGoogle(User user) async {
    localDataSource.deleteUser(user);
    return true;
  }
}
