import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/single_message/models/message_model.dart';

class TextMessage extends StatelessWidget {
  final MessageModel messageModel;
  TextMessage({
    @required this.messageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          messageModel.isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: kPADDING, horizontal: kPADDING * 4),
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(messageModel.isMe ? 1 : 0.1),
              borderRadius: messageModel.isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(ROUNDED),
                      topRight: Radius.circular(ROUNDED),
                      bottomRight: Radius.circular(ROUNDED),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(ROUNDED),
                      topRight: Radius.circular(ROUNDED),
                      bottomLeft: Radius.circular(ROUNDED),
                    )),
          child: Text(
            messageModel.content,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: messageModel.isMe
                      ? Colors.white
                      : Theme.of(context).textTheme.subtitle1.color,
                ),
          ),
        ),
      ],
    );
  }
}
