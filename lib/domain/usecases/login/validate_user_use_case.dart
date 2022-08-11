import 'package:clean_books/domain/entities/user.dart';
import 'package:clean_books/domain/repositories/users_repository.dart';
import 'package:clean_books/injection_container.dart';

class ValidateUserUseCase {
  final UsersRepository usersRepository;

  ValidateUserUseCase(UsersRepository? usersRepository)
      : usersRepository = usersRepository ??= sl<UsersRepository>();

  Future<bool> call(User user) async {
    return usersRepository.validateUser(user);
  }
}
