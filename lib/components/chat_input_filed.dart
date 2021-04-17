import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/single_message/view/single_message_provider.dart';

class ChatInputField extends StatelessWidget {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SingleMessageProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kPADDING,
        vertical: kPADDING / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kPADDING * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          data.send(value, _controller);
                        },
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          data.send(_controller.text, _controller);
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
