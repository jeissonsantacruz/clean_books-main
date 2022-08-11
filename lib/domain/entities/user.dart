import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.name,
    this.password,
  });

  final String? name;
  final String? password;

  User copyWith({
    String? name,
    String? password,
  }) =>
      User(
        name: name ?? this.name,
        password: password ?? this.password,
      );
  @override
  List<Object?> get props => [name, password];
}
