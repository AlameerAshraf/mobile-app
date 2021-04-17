import 'package:flutter/foundation.dart';

class MessageModel {
  bool isMe;
  String content;
  MessageModel({
    @required this.isMe,
    @required this.content,
  });
}
