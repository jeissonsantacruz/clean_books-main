import 'dart:convert';
import 'package:clean_books/domain/entities/user.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

/// user model that extends the user entity
class UserModel extends User {
  UserModel({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
