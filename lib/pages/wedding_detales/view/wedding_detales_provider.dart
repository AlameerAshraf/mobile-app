import 'package:flutter/cupertino.dart';
import 'package:weds360/core/helpers/Validation.dart';
import 'package:weds360/pages/wedding_detales/models/wedding_detales_model.dart';

class WeddingDetalesProvider extends ChangeNotifier {
  WeddingDetalesModel weddingDetalesModel = WeddingDetalesModel(
    weddingDate: '25/02/2021',
    venue: 'Bank Masr',
    buddget: 5000,
    numberOfGuest: 200,
  );
  String newWeddingDate;
  String newVenue;
  int newBudget;
  bool isWeddingDateValid = true;
  bool isVenueValid = true;
  bool isBudgetValid = true;
  void onChangeWeddingDate(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newWeddingDate = value;
      notifyListeners();
    }
  }

  void onEditWeddingDate(String value, BuildContext context) {
    isWeddingDateValid = Validation.birthDayValidation(value);
    if (isWeddingDateValid) {
      weddingDetalesModel.weddingDate = value;
      newWeddingDate = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onChangeVenue(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newVenue = value;
      notifyListeners();
    }
  }

  void onEditVenue(String value, BuildContext context) {
    if (value == null || value.isEmpty) {
      isVenueValid = false;
    } else {
      isVenueValid = true;
      weddingDetalesModel.venue = value;
      newWeddingDate = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onChangeBudget(String value) {
    if (value == null || value.isEmpty) {
      print('NO');
    } else {
      print('YES');
      newBudget = int.parse(value);
      notifyListeners();
    }
  }

  void onEditBudget(String value, BuildContext context) {
    if (value == null || value.isEmpty) {
      isVenueValid = false;
    } else {
      isVenueValid = true;
      weddingDetalesModel.buddget = int.parse(value);
      newWeddingDate = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }
}
