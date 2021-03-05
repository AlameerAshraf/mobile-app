import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weds360/pages/home/models/recomended_model.dart';

class HomeProvider extends ChangeNotifier {
  List<RecomendedModel> _recomendedModelList = [];
  
  Future<void> getList(BuildContext context) async {
    var source = await DefaultAssetBundle.of(context)
        .loadString('assets/json/recmended.json');

    var items = json.decode(source);
    Timer(Duration(seconds: 1), () {
      for (var item in items) {
        _recomendedModelList.add(RecomendedModel.fromJson(item));
      }
      notifyListeners();
    });
  }

  List<RecomendedModel> get recomendedModelList => [..._recomendedModelList];
}
