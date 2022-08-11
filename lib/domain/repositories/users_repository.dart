import 'package:clean_books/domain/entities/user.dart';

abstract class UsersRepository {
  Future<bool> validateUser(User user);
}
