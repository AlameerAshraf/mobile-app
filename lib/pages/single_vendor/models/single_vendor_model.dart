import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:weds360/pages/single_vendor/models/review_model.dart';

class SingleVendrorModel {
  String id;
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
  SingleVendrorModel(
      {@required this.imageUrls,
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
      this.id});

  String getFacebookUrl(List<String> social) {
    for (String item in social) {
      if (item.contains('facebook')) {
        return item;
      }
    }
    return 'https://www.facebook.com/';
  }

  String getInstagramUrl(List<String> social) {
    for (String item in social) {
      if (item.contains('instagram')) {
        return item;
      }
    }
    return 'https://www.facebook.com/';
  }

  factory SingleVendrorModel.fromMap(Map<String, dynamic> map) {
    var list = map['comments'] as List;

    List<ReviewModel> reviewlist =
        list.map((i) => ReviewModel.fromJson(i)).toList();
    return SingleVendrorModel(
        imageUrls: map['gallery'],
        title: map['nameEn'],
        descreption: map['descriptionEn'],
        phone: map['phone'],
        facebookUrl: 'https://www.facebook.com/',
        instagramUrl: 'https://www.instagram.com/',
        websiteUrl: 'https://www.google.com/',
        reviews: 1000,
        rate: map['ranks'],
        category: map['category'],
        address: map['location']['typedAddress'],
        isFavorite: false,
        reviewsList: reviewlist);
  }

  factory SingleVendrorModel.fromJson(String source) =>
      SingleVendrorModel.fromMap(json.decode(source));
}
