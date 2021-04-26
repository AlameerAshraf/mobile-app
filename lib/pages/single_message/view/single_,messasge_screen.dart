
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/chat_input_filed.dart';
import 'package:weds360/components/message.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/single_message/models/message_model.dart';
import 'package:weds360/pages/single_message/view/single_message_provider.dart';

class SingleMessageScreen extends StatefulWidget {
  static const String id = 'Single Messeges';

  @override
  _SingleMessageScreenState createState() => _SingleMessageScreenState();
}

class _SingleMessageScreenState extends State<SingleMessageScreen> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SingleMessageProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButton(),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://image.freepik.com/free-photo/cheerful-teenager-with-toothy-smile-afro-hairstyle-holds-modern-cell-phone-chats-online-with-boyfriend_273609-30470.jpg'),
            ),
            SizedBox(width: kPADDING * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kristin Watson",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                Text(
                  "Active 3m ago",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w300),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_phone),
            onPressed: () {
              data.launchURL('tel:' + '01001289970');
            },
          ),
          SizedBox(width: kPADDING / 2),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(kPADDING),
              child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: data.messages.length,
                  itemBuilder: (context, index) => TextMessage(
                        messageModel: MessageModel(
                            content: data.messages[index].content,
                            isMe: data.messages[index].isMe),
                      )),
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}
