import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weds360/pages/single_message/models/message_model.dart';

class SingleMessageProvider extends ChangeNotifier {
  List<MessageModel> _messages = [
    MessageModel(isMe: true, content: 'Hi'),
    MessageModel(isMe: false, content: 'Hi'),
    MessageModel(isMe: true, content: 'Hi'),
    MessageModel(isMe: false, content: 'Hi'),
    MessageModel(isMe: true, content: 'Hi'),
    MessageModel(isMe: false, content: 'Hi'),
    MessageModel(isMe: true, content: 'Hi'),
    MessageModel(isMe: false, content: 'Hi'),
  ];

  List<MessageModel> get messages {
    return _messages.reversed.toList();
  }
    void launchURL(String url) async {
    await canLaunch(url)
        ? await launch(
            url,
            universalLinksOnly: true,
          )
        : throw 'Could not launch $url';
  }

  void send(String message, TextEditingController controller) {
    if (message == null || message.isEmpty) {
    } else {
      _messages.add(
        MessageModel(isMe: true, content: message),
      );

      controller.clear();
      notifyListeners();
    }
  }
}
