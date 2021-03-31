import 'package:flutter/foundation.dart';
import 'package:weds360/pages/single_vendor/models/review_model.dart';

class SingleVendrorModel {
  List<String> imageUrls;
  String title;
  String descreption;
  String phone;
  String facebookUrl;
  String instagramUrl;
  String websiteUrl;
  String category;
  String address;
  int reviews;
  double rate;
  bool isFavorite;
  List<ReviewModel> reviewsList;
  SingleVendrorModel({
    @required this.imageUrls,
    @required this.title,
    @required this.descreption,
    @required this.phone,
    @required this.facebookUrl,
    @required this.instagramUrl,
    @required this.websiteUrl,
    @required this.reviews,
    @required this.rate,
    @required this.isFavorite,
    @required this.category,
    @required this.address,
    this.reviewsList,
  });
}
