import 'dart:convert';

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
  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      imagePath: map['image'],
      name: map['name'],
      rate: map['rate'],
      content: map['content'],
    );
  }

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source));
}
