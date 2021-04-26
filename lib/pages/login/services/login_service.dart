import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/login/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<void> signin(LoginModel loginModel) async {
    print(loginModel.email);
    print(loginModel.password);
    print(1);
    var responce = await http.post(
      PRE_PRODUCTION_BASE_URL + 'api/v1/users/sign-in/' + CLINTID,
      headers: {"Content-Type": "application/json"},
      body: loginModel.toJson(),
    );
    print(2);
    if (responce.statusCode == 400) {
      print('3');
      var data = json.decode(responce.body);
      throw Exception(data['errors']['message']);
    } else {
      print('4');
      var data = json.decode(responce.body);
      print(data['error']);
      if (data['error'] == true) {
        print(45);
        print(responce.statusCode);
        print(data['code']);
        throw Exception(data['details']);
      } else {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('TOKEN', data['data']['token']);
        print(sharedPreferences.get('TOKEN'));
        return Future.value();
      }
    }
  }
}
