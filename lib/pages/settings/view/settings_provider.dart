import 'package:flutter/cupertino.dart';
import 'package:weds360/core/helpers/Validation.dart';

class SettingsProvider extends ChangeNotifier {
  String oldPassword;
  String newPassword;
  String confermPassord;
  bool isOldPasswordValid = true;
  bool isNewPasswordValid = true;
  bool isConfermPassordValid = true;

  void onChangeOldPassword(String value) {
    oldPassword = value;
    notifyListeners();
  }

  void onChangeNewPassword(String value) {
    newPassword = value;
    notifyListeners();
  }

  void onChangeConfermPassword(String value) {
    confermPassord = value;
    notifyListeners();
  }

  void oldPassowrdValidation(String value) {
    isOldPasswordValid = Validation.passwordValidation(value);
    notifyListeners();
  }

  void newPasswordValidation(String value) {
    isNewPasswordValid = Validation.passwordValidation(value);
    notifyListeners();
  }

  void confermPasswordValidation(String value) {
    isConfermPassordValid =
        Validation.confermPasswordValidation(newPassword, value);
    notifyListeners();
  }

  void submit(BuildContext context) {
    oldPassowrdValidation(oldPassword);
    newPasswordValidation(newPassword);
    confermPasswordValidation(confermPassord);

    if (isOldPasswordValid && isNewPasswordValid && isConfermPassordValid) {
      Navigator.of(context, rootNavigator: true).pop();
    }
    notifyListeners();
  }
}
