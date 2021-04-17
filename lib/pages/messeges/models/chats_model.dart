import 'package:flutter/cupertino.dart';

class ChatsModel {
  String imagePath;
  String name;
  String lastMessage;
  String time;
  ChatsModel({
    @required this.imagePath,
    @required this.name,
    @required this.lastMessage,
    @required this.time,
  });
}
