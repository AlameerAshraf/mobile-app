import 'dart:io';

import 'package:flutter/foundation.dart';

class UserModel {
  File image;
  String username;
  String email;
  String phone;
  String birthDay;
  String financeName;
  String financeBirthDay;
  String financePhone;
  UserModel({
    @required this.image,
    @required this.username,
    @required this.email,
    @required this.phone,
    @required this.birthDay,
    @required this.financeName,
    @required this.financeBirthDay,
    @required this.financePhone,
  });
  
}
