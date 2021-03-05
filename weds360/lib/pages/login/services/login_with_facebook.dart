import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginWithFacebook {
  AccessToken accessToken;
  FacebookAuth facebookAuth;
  LoginWithFacebook() {
    facebookAuth = FacebookAuth.instance;
   
  }

  Future<void> login() async {
    try {
      accessToken = await facebookAuth.login(
        loginBehavior: LoginBehavior.NATIVE_WITH_FALLBACK,
      );

      Map<String, dynamic> json = await facebookAuth.getUserData();
      
    } on FacebookAuthException catch (e) {
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print("You have a previous login operation in progress");
          break;
        case FacebookAuthErrorCode.CANCELLED:
          print("login cancelled");
          break;
        case FacebookAuthErrorCode.FAILED:
          print("login failed");
          break;
      }
    }
  }
}
