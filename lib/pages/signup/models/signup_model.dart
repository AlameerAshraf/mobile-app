import 'dart:convert';

class SignupModel {
  String name;
  // String partnerName;
  String email;
  String password;
  String confermPassword;
  SignupModel({
    this.name,
    // this.partnerName,
    this.email,
    this.password,
    this.confermPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      "user": {
        "name": name,
        "email": email,
        'password': password,
        "role": "USER",
        "accountSource": "WEDS360",
      }
    };
  }

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(
      name: map['name'],
      // partnerName: map['partnerName'],
      email: map['email'],
      password: map['password'],
      confermPassword: map['confermPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupModel.fromJson(String source) =>
      SignupModel.fromMap(json.decode(source));
}
