class Validation {
  static bool emailValidation(String value) {
    if (value != null) {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static bool passwordValidation(String value) {
    if (value != null) {
      if (RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$").hasMatch(value)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static bool phoneValidation(String value) {
    if (value != null) {
      if (RegExp(r"(01)[0-9]{9}").hasMatch(value)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static bool birthDayValidation(String value) {
    if (value != null) {
      if (RegExp(
              r"^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))|^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d+$")
          .hasMatch(value)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static bool nameValidation(String value) {
    if (value != null) {
      if (RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
          .hasMatch(value)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static bool confermPasswordValidation(
      String password, String confermPassword) {
    if (password != null || confermPassword != null) {
      if (password == confermPassword) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
