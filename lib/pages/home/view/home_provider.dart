import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weds360/pages/blog/view/blog_screen.dart';
import 'package:weds360/pages/categorys/view/categorys_screen.dart';
import 'package:weds360/pages/home/models/checklist_model.dart';
import 'package:weds360/pages/home/models/planer_model.dart';
import 'package:weds360/pages/home/view/Homes_page_body.dart';
import 'package:weds360/pages/home/view/home_screen.dart';
import 'package:weds360/pages/messeges/view/messeges_screen.dart';

import 'package:weds360/pages/settings/view/settings_screen.dart';

class HomeProvider extends ChangeNotifier {
  List<PlanerModel> planner = [
    PlanerModel(
        percent: 1.0,
        title: 'Guest List',
        description:
            'Effprtless track and take care of all your wedding invites'),
    PlanerModel(
        percent: 0.40,
        title: 'Wedding Website',
        description:
            'Effprtless track and take care of all your wedding invites'),
    PlanerModel(
        percent: 0.60,
        title: 'Budgeter',
        description:
            'Effprtless track and take care of all your wedding invites'),
    PlanerModel(
        percent: 0.80,
        title: 'Registry',
        description:
            'Effprtless track and take care of all your wedding invites'),
    PlanerModel(
        percent: 0.8,
        title: 'CheckList',
        description:
            'Effprtless track and take care of all your wedding invites'),
  ];
  List<CheckListModel> _checkLists = [
    CheckListModel(title: 'Hire Planner', isSelcted: false),
    CheckListModel(title: 'Reserve my venue', isSelcted: false),
    CheckListModel(title: 'Create guest list', isSelcted: false),
    CheckListModel(title: 'Create color scheme', isSelcted: false),
    CheckListModel(title: 'Plan your Menu', isSelcted: false),
  ];
  String newLabel;
  String selctedPage = HomeScreen.id;
  void onChangeCheckList(bool selcted, int index) {
    checkLists[index].isSelcted = selcted;
    checkListPercent();
    notifyListeners();
  }

  void checkListPercent() {
    if (_checkLists.isEmpty) {
      planner.last.percent = 0.0;
    } else {
      int size = _checkLists
          .where((element) => element.isSelcted == true)
          .toList()
          .length;
      planner.last.percent = size / _checkLists.length;
    }
    notifyListeners();
  }

  void onAddCheckListItem(String title) {
    if (title == null) {
    } else {
      _checkLists.add(CheckListModel(title: title, isSelcted: false));
      newLabel = null;
    }
    notifyListeners();
  }

  void onDeleteCheckList(int index) {
    checkLists.removeAt(index);
    checkListPercent();
    notifyListeners();
  }

  void onLabelChangeCheckList(int index, String title) {
    if (title == null) {
    } else {
      checkLists[index].title = title;
      newLabel = null;
      checkListPercent();
    }
    notifyListeners();
  }

  List<CheckListModel> get checkLists {
    return _checkLists;
  }

  void changePage(String id) {
    selctedPage = id;
    notifyListeners();
  }

  Widget currentPage() {
    switch (selctedPage) {
      case HomeScreen.id:
        return HomePageBody();
        break;
      case SettingsScreen.id:
        return SettingsScreen();
        break;
      case BlogScreen.id:
        return BlogScreen();
        break;

      case CategorysScreen.id:
        return CategorysScreen();
        break;

      case MessegesScreen.id:
        return MessegesScreen();
        break;
      default:
        return HomeScreen();
    }
  }

  void launchURL(String url) async {
    await canLaunch(url)
        ? await launch(
            url,
            universalLinksOnly: true,
          )
        : throw 'Could not launch $url';
  }

  void budgeterPersintege(double percent) {
    planner[2].percent = percent;
    notifyListeners();
  }
}
