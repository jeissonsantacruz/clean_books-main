import 'package:clean_books/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> loginUserByGoogle(User user);

  Future<bool> logoutUserByGoogle(User user);
}
