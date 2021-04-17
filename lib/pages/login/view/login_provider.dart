import 'package:flutter/cupertino.dart';
import 'package:weds360/core/helpers/Validation.dart';

import 'package:weds360/pages/home/view/home_screen.dart';

import 'package:weds360/pages/login/models/login_model.dart';
import 'package:weds360/pages/login/services/login_with_facebook.dart';
import 'package:weds360/pages/login/services/login_with_google.dart';
import 'package:weds360/pages/signup/view/signup_screen.dart';

class LoginProviedr extends ChangeNotifier {
  LoginModel loginModel = LoginModel();
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  void onChangedEmail(String value) {
    loginModel.email = value;
    notifyListeners();
  }

  void onChangedPassword(String value) {
    loginModel.password = value;
    notifyListeners();
  }

  void emailValidation(String value) {
 
    _isEmailValid = Validation.emailValidation(value);

    notifyListeners();
  }

  void passwordValidation(String value) {
   
    _isPasswordValid = Validation.passwordValidation(value);
    notifyListeners();
  }

  bool get isEmailValid {
    return _isEmailValid;
  }

  bool get isPasswordValid {
    return _isPasswordValid;
  }

  void login(BuildContext context) {
    emailValidation(loginModel.email);
    passwordValidation(loginModel.password);
    if (_isEmailValid && _isPasswordValid) {
      _clear();
      Navigator.popAndPushNamed(context, HomeScreen.id);
    }
    notifyListeners();
  }

  void signup(BuildContext context) {
    _clear();
    notifyListeners();
    Navigator.pushNamed(context, SignUpScreen.id);
  }

  void loginWithFacebook(BuildContext context) async {
    LoginWithFacebook loginWithFacebook = new LoginWithFacebook();
    await loginWithFacebook.login();
    if (loginWithFacebook.accessToken != null) {
      _clear();
      Navigator.pushNamed(context, SignUpScreen.id);
    }
  }

  void loginWithGoogle(BuildContext context) async {
    LoginWithGoogle loginWithGoogle = new LoginWithGoogle();
    await loginWithGoogle.login();

    if (loginWithGoogle.googleSignIn.currentUser != null) {
      _clear();
      Navigator.pushNamed(context, SignUpScreen.id);
    }
  }

  void _clear() {
    loginModel.email = null;
    loginModel.password = null;
    _isEmailValid = true;
    _isPasswordValid = true;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
