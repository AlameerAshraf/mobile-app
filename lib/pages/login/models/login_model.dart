import 'dart:convert';

class LoginModel {
  String email;
  String password;
  LoginModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "userCredentials": {"email": email, "password": password}
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
