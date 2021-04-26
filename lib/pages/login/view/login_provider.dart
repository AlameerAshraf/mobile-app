import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Validation.dart';

import 'package:weds360/pages/home/view/home_screen.dart';

import 'package:weds360/pages/login/models/login_model.dart';
import 'package:weds360/pages/login/services/login_service.dart';
import 'package:weds360/pages/login/services/login_with_facebook.dart';
import 'package:weds360/pages/login/services/login_with_google.dart';
import 'package:weds360/pages/signup/view/signup_screen.dart';

class LoginProviedr extends ChangeNotifier {
  LoginModel loginModel = LoginModel();
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool isLodding = false;
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

  void login(BuildContext context) async {
    emailValidation(loginModel.email);
    passwordValidation(loginModel.password);
    if (_isEmailValid && _isPasswordValid) {
      try {
        isLodding = true;
        await LoginService.signin(loginModel);
        notifyListeners();
        isLodding = false;
        _clear();
        notifyListeners();
        Navigator.popAndPushNamed(context, HomeScreen.id);
      } catch (e) {
        showFlash(
          context: context,
          duration: Duration(seconds: 3),
          builder: (context, controller) {
            return Flash(
              controller: controller,
              backgroundColor: Theme.of(context).primaryColor,
              boxShadows: kElevationToShadow[4],
              horizontalDismissDirection: HorizontalDismissDirection.horizontal,
              child: FlashBar(
                message: Text(e.toString()),
              ),
            );
          },
        );
        isLodding = false;
      }
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
