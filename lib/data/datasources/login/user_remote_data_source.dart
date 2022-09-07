import 'package:clean_books/core/errors/exceptions.dart';
import 'package:clean_books/core/framework/apis.dart';
import 'package:clean_books/data/models/user_model.dart';
import 'package:clean_books/domain/entities/user.dart';
import 'package:http/http.dart';

/// Abstract class for the User remote data source.
abstract class UserRemoteDataSource {
  /// Method to validate a  user in remote data.
  Future<User> validateUser(User user);
}

/// Implementation of the User remote data source
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Client client;

  UserRemoteDataSourceImpl(this.client);

  @override
  Future<User> validateUser(User user) async {
    final url = Uri.parse(usersUrl);
    final Response response = await client.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.body as Map<String, dynamic>;
      return UserModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
