

import 'package:flutter/cupertino.dart';

class RecomendedModel {
  String imagePath;
  String title;
  String descreption;

  RecomendedModel({
    @required this.imagePath,
    @required this.title,
    @required this.descreption,
  });

  RecomendedModel.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    title = json['title'];
    descreption = json['descreption'];
  }
}
