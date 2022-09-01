import 'package:clean_books/domain/entities/user.dart';

/// Abstract class for the authentication repository
abstract class AuthenticationRepository {
  ///Method to login by google
  Future<User> loginUserByGoogle(User user);

  ///Method to logout by google
  Future<bool> logoutUserByGoogle(User user);
}
