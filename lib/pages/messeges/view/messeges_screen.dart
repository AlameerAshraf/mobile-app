import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/chat_card.dart';

import 'package:weds360/pages/messeges/view/messeges_provider.dart';
import 'package:weds360/pages/single_message/view/single_,messasge_screen.dart';

class MessegesScreen extends StatefulWidget {
  static const String id = 'Messeges';

  @override
  _MessegesScreenState createState() => _MessegesScreenState();
}

class _MessegesScreenState extends State<MessegesScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MessagesProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          // itemExtent: 150.0,
          itemCount: data.chats.length,
          itemBuilder: (context, index) => ChatCard(
            chat: data.chats[index],
            onPressed: () {
              Navigator.pushNamed(context, SingleMessageScreen.id);
            },
          ),
        ),
      ),
    );
  }
}
