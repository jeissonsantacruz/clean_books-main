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
  final List<User> _userList = [];
  final List<User> _usersValidates = <User>[
    const User(email: 'user1', password: 'password1'),
    const User(email: 'user2', password: 'password2'),
  ];

  @override
  Future<bool> validateUser(User user) async {
    await Future.delayed(Duration(seconds: 1));
    final bool result = _usersValidates.contains(user);
    return result;
  }

  @override
  Future<bool> saveUser(User user) async {
    await Future.delayed(Duration(seconds: 1));
    _userList.add(user);
    return true;
  }

  @override
  void deleteUser(User user) {
    _userList.remove(user);
  }
}
