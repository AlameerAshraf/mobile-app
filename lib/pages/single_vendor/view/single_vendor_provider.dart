import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weds360/core/helpers/token_not_valid_exception.dart';
import 'package:weds360/pages/login/view/login_screen.dart';

import 'package:weds360/pages/single_vendor/models/single_vendor_model.dart';
import 'package:weds360/pages/single_vendor/services/single_vindor_service.dart';

class SingleVendorProvider extends ChangeNotifier {
  SingleVendrorModel singleVendrorModel;

  void getData({@required String id, @required BuildContext context}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      singleVendrorModel = await SingleVindorService.singleVindor(
          token: sharedPreferences.get('TOKEN'),
          vindorID: '6061b86e553720132028ee64');

      notifyListeners();
    } on TokenNotValidExcpetion catch (e) {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.id, (route) => false);
    } catch (e) {}
  }

  int activeimageSlider = 0;
  void onSliderpageChange(int index) {
    activeimageSlider = index;
    notifyListeners();
  }

  void launchURL(String url) async {
    await canLaunch(url)
        ? await launch(
            url,
            universalLinksOnly: true,
          )
        : throw 'Could not launch $url';
  }

  void onFavoriteClick() {
    singleVendrorModel.isFavorite = !singleVendrorModel.isFavorite;
    notifyListeners();
  }
}
