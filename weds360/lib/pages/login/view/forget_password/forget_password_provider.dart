import 'package:flutter/cupertino.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  String _email;
  bool _isEmailValid = true;

  void onChangedEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void emailValidation(String value) {
    if (value != null) {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        _isEmailValid = true;
      } else {
        _isEmailValid = false;
      }
    } else {
      _isEmailValid = false;
    }
    notifyListeners();
  }

  bool get isEmailValid {
    return _isEmailValid;
  }

  void submit(BuildContext context) {
    emailValidation(_email);

    if (_isEmailValid) {
      Navigator.of(context, rootNavigator: true).pop();
    }
    notifyListeners();
  }

  void close(BuildContext context) {
    _email = null;
    _isEmailValid = true;
    Navigator.of(context, rootNavigator: true).pop();

    notifyListeners();
  }
}
