import 'dart:convert';

import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/signup/models/signup_model.dart';
import 'package:http/http.dart' as http;

class SignupService {
  static Future<void> signUp(SignupModel signupModel) async {
    print(1);
    var responce = await http.post(
        PRE_PRODUCTION_BASE_URL + 'api/v1/users/sign-up/' + CLINTID,
        headers: {"Content-Type": "application/json"},
        body: signupModel.toJson());
    // print(signupModel.toJson());
    print(responce.body);
    if (responce.statusCode == 400) {
      print('3');
      var data = json.decode(responce.body);
      throw Exception(data['errors']['message']);
    } else {
      print('4');
      var data = json.decode(responce.body);

      if (data['error']) {
        throw Exception(data['message']);
      } else {
        return Future.value();
      }
    }
  }
}
