import 'package:flutter/cupertino.dart';
import 'package:weds360/core/helpers/Validation.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  String _email;
  bool _isEmailValid = true;

  void onChangedEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void emailValidation(String value) {
    _isEmailValid = Validation.emailValidation(value);
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
