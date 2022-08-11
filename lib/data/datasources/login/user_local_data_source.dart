import 'package:clean_books/domain/entities/user.dart';

abstract class UserLocalDataSource {
  Future<bool> validateUser(User user);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl();

  @override
  Future<bool> validateUser(User user) async {
    await Future.delayed(Duration(seconds: 1));
    final bool result = usersValidates.contains(user);
    return result;
  }

  static const List<User> usersValidates = <User>[
    const User(name: 'maria', password: 'password'),
    const User(name: 'pedro', password: '123456')
  ];
}
