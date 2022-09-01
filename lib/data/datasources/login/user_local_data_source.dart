import 'package:clean_books/domain/entities/user.dart';

/// Abstract class for the User local data source.
abstract class UserLocalDataSource {
  /// Method to validate a user in local data
  Future<bool> validateUser(User user);

  /// Method to save a user in local data
  Future<bool> saveUser(User user);

  ///Method to delete a user in local data
  void deleteUser(User user);
}

/// Implementation of the UserLocalDataSource
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
