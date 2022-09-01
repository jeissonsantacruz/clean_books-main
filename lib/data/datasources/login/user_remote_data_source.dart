import 'package:clean_books/data/models/user_model.dart';
import 'package:clean_books/domain/entities/user.dart';

/// Abstract class for the User remote data source.
abstract class UserRemoteDataSource {
  /// Method to validate a  user in remote data.
  Future<User> validateUser(User user);
}

/// Implementation of the User remote data source
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl();

  @override
  Future<User> validateUser(User user) async {
    await Future.delayed(Duration(seconds: 1));
    //TODO: (JSON) implements the service with firebase
    final Map<String, String> data = Map<String, String>();
    final UserModel userModel = new UserModel.fromJson(data);
    return userModel;
  }
}
