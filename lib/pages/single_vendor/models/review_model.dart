import 'package:flutter/foundation.dart';

class ReviewModel {
  String imagePath;
  String name;
  double rate;
  String content;
  ReviewModel({
    @required this.imagePath,
    @required this.name,
    @required this.rate,
    @required this.content,
  });
  
}
