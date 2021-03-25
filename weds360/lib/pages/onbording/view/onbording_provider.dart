import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/login/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBordingProvider extends ChangeNotifier {
  String _iamgePath = 'assets/images/onbordingone.png';
  double heaghtMax;
  double heaght;
  
  int _count = 3;
  int _selected = 0;

  String get iamgePath {
    return _iamgePath;
  }

  int get selected {
    return _selected;
  }

  int get count {
    return _count;
  }

  void _imagePath() {
    if (_selected == 0) {
      _iamgePath = 'assets/images/onbordingone.png';
    } else if (_selected == 1) {
      _iamgePath = 'assets/images/onbordingtwo.png';
    } else {
      _iamgePath = 'assets/images/onbordingone.png';
    }
    heaght = heaghtMax;
    notifyListeners();
  }



  void start(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(kFirstTime, true);

    Navigator.popAndPushNamed(context, LoginScreen.id);
  }

}