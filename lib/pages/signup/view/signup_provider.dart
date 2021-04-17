import 'package:flutter/cupertino.dart';
import 'package:weds360/core/helpers/Validation.dart';
import 'package:weds360/pages/signup/models/signup_model.dart';

class SignupProvider extends ChangeNotifier {
  SignupModel signupModel = new SignupModel();
  bool isNameValid = true;
  bool isPartnerNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfermPasswordValid = true;
  void onChangeName(String value) {
    signupModel.name = value;
    notifyListeners();
  }

  void onChangePartnerName(String value) {
    signupModel.partnerName = value;
    notifyListeners();
  }

  void onChangeEmail(String value) {
    signupModel.email = value;
    notifyListeners();
  }

  void onChangePassword(String value) {
    signupModel.password = value;
    notifyListeners();
  }

  void onChangeConfremPassword(String value) {
    signupModel.confermPassword = value;
    notifyListeners();
  }

  void nameValidation(String value) {
    isNameValid = Validation.nameValidation(value);

    notifyListeners();
  }

  void parterNameValidation(String value) {
    isPartnerNameValid = Validation.nameValidation(value);

    notifyListeners();
  }

  void emailValidation(String value) {
    isEmailValid = Validation.emailValidation(value);

    notifyListeners();
  }

  void passwordValidation(String value) {
    isPasswordValid = Validation.passwordValidation(value);
    notifyListeners();
  }

  void confermPasswordValidation(String value) {
    isConfermPasswordValid =
        Validation.confermPasswordValidation(value, signupModel.password);
    notifyListeners();
  }

  void signup(BuildContext context) {
    nameValidation(signupModel.name);
    parterNameValidation(signupModel.partnerName);

    emailValidation(signupModel.email);
    passwordValidation(signupModel.password);
    confermPasswordValidation(signupModel.confermPassword);
    if (isNameValid &&
        isPartnerNameValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfermPasswordValid) {
      clear();
      Navigator.pop(context);
    }
    notifyListeners();
  }

  void clear() {
    signupModel.name = null;
    signupModel.partnerName = null;

    signupModel.email = null;
    signupModel.password = null;
    signupModel.confermPassword = null;
    isNameValid = true;
    isPartnerNameValid = true;

    isEmailValid = true;
    isPasswordValid = true;
    isConfermPasswordValid = true;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
