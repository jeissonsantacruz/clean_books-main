import 'package:equatable/equatable.dart';

/// Entity class that represents a user model
class User extends Equatable {
  const User({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  User copyWith({
    String? email,
    String? password,
  }) =>
      User(
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  List<Object?> get props => [email, password];
}

class UserError extends User {}
