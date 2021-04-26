import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weds360/core/helpers/Validation.dart';
import 'package:weds360/pages/edit_profile/models/user_model.dart';

class EditProfileProvider extends ChangeNotifier {
  UserModel user = UserModel(
      image: null,
      username: 'ali motie',
      email: 'amotie@outlook.com',
      phone: '01001289970',
      birthDay: '28/02/1998',
      financeName: 'nada mohmed',
      financeBirthDay: null,
      financePhone: null);
  String newUsername;
  String newEmail;
  String newPhone;
  String newBirthDay;
  String newFinaceName;
  String newFinanceBirthDay;
  String newFinacePhone;
  bool isUsernameValid = true;
  bool isEmailValid = true;
  bool isPhoneValed = true;
  bool isBirthDayValid = true;
  bool isFinanceNameValid = true;
  bool isFinanceBirthDayValid = true;
  bool isFinancePhoneValid = true;
  void getImage() async {
    final _picker = ImagePicker();
    final image = await _picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      user.image = File(image.path);
    }
    notifyListeners();
  }

  void onChangeUserName(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newUsername = value;
      notifyListeners();
    }
  }

  void onEditUsername(String value, BuildContext context) {
    isUsernameValid = Validation.nameValidation(value);
    if (isUsernameValid) {
      user.username = value;
      newUsername = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onChangeEmail(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newEmail = value;
      notifyListeners();
    }
  }

  void onEditEmail(String value, BuildContext context) {
    isEmailValid = Validation.emailValidation(value);

    if (isEmailValid) {
      user.email = value;
      newEmail = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onChangePhone(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newPhone = value;
      notifyListeners();
    }
  }

  void onEditPhone(String value, BuildContext context) {
    isPhoneValed = Validation.phoneValidation(value);
    if (isPhoneValed) {
      user.phone = value;
      newPhone = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onChangeBirthDay(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newBirthDay = value;
      notifyListeners();
    }
  }

  void onEditBithDay(String value, BuildContext context) {
    isBirthDayValid = Validation.birthDayValidation(value);
    if (isBirthDayValid) {
      user.birthDay = value;
      newBirthDay = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onChangeFinanceName(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newFinaceName = value;
      notifyListeners();
    }
  }

  void onEditFinanceName(String value, BuildContext context) {
    isFinanceNameValid = Validation.nameValidation(value);
    if (isFinanceNameValid) {
      user.financeName = value;
      newFinaceName = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onChangeFinanceBirhDay(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newFinanceBirthDay = value;
      notifyListeners();
    }
  }

  void onEditFinanceBirthDay(String value, BuildContext context) {
    isFinanceBirthDayValid = Validation.birthDayValidation(value);
    if (isFinanceBirthDayValid) {
      user.financeBirthDay = value;
      newFinanceBirthDay = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onChangeFinancePhone(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newFinacePhone = value;
      notifyListeners();
    }
  }

  void onEditFinancePhone(String value, BuildContext context) {
    isFinancePhoneValid = Validation.phoneValidation(value);
    if (isFinancePhoneValid) {
      user.financePhone = value;
      newFinacePhone = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }
}
