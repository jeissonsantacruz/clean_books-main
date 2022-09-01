import 'package:clean_books/domain/entities/user.dart';
import 'package:clean_books/domain/repositories/auth_repository.dart';
import 'package:clean_books/injection_container.dart';

/// Class that contains the use case to login a user by Google
class ValidateUserUseCase {
  final AuthenticationRepository authRepository;

  ValidateUserUseCase(AuthenticationRepository? authRepository)
      : authRepository = authRepository ?? sl<AuthenticationRepository>();

  Future<User> call(User user) async {
    return authRepository.loginUserByGoogle(user);
  }
}
