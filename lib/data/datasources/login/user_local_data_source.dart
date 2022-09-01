import 'package:clean_books/domain/entities/user.dart';

abstract class UserLocalDataSource {
  Future<bool> validateUser(User user);

  Future<bool> saveUser(User user);

  void deleteUser(User user);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl();
  List<User> userList = [];
  @override
  Future<bool> validateUser(User user) async {
    await Future.delayed(Duration(seconds: 1));
    final bool result = usersValidates.contains(user);
    return result;
  }

  @override
  Future<bool> saveUser(User user) async {
    /// lista local
    await Future.delayed(Duration(seconds: 1));
    userList.add(user);
    return true;
  }

  @override
  void deleteUser(User user) {
    userList.remove(user);
  }

  static const List<User> usersValidates = <User>[
    const User(email: 'maria', password: 'password'),
    const User(email: 'pedro', password: '123456')
  ];
}
