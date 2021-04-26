import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/Validation.dart';
import 'package:weds360/pages/signup/models/signup_model.dart';
import 'package:weds360/pages/signup/services/signup_service.dart';
import 'package:flash/flash.dart';

class SignupProvider extends ChangeNotifier {
  SignupModel signupModel = new SignupModel();
  bool isNameValid = true;
  bool isPartnerNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfermPasswordValid = true;
  bool isLodding = false;
  String snackbardata;
  void onChangeName(String value) {
    signupModel.name = value;
    notifyListeners();
  }

  // void onChangePartnerName(String value) {
  //   signupModel.partnerName = value;
  //   notifyListeners();
  // }

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

  void signup(BuildContext context) async {
    nameValidation(signupModel.name);
    // parterNameValidation(signupModel.partnerName);

    emailValidation(signupModel.email);
    passwordValidation(signupModel.password);
    confermPasswordValidation(signupModel.confermPassword);
    if (isNameValid &&
        // isPartnerNameValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfermPasswordValid) {
      try {
        print('yes');
        isLodding = true;
        await SignupService.signUp(signupModel);
        print('yes');
        notifyListeners();
        isLodding = false;
        clear();
        notifyListeners();
        Navigator.pop(context);
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
        print('No');

        isLodding = false;
        notifyListeners();
      }
    }

    notifyListeners();
  }

  void clear() {
    signupModel.name = null;
    // signupModel.partnerName = null;

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
