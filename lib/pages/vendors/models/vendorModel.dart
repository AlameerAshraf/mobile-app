import 'package:flutter/foundation.dart';

class VendorModel {
  String id;
  String imagePath;
  String title;
  double rate;
  bool isFavorite;
  VendorModel({
    @required this.id,
    @required this.imagePath,
    @required this.title,
    @required this.rate,
    this.isFavorite = false,
  });
}
