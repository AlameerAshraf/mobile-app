import 'dart:io';



class RegistryModel {
  String title;
  String address;
  String note;
  double price;
  File image;
  RegistryModel({
    this.title,
    this.address,
    this.note,
    this.price,
    this.image,
  });
}
