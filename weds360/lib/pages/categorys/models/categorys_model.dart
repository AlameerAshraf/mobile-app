import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CategorysModel {
  String imagePath;
  String title;
  IconData icon;
  CategorysModel({
    @required this.imagePath,
    @required this.title,
    @required this.icon,
  });
}
