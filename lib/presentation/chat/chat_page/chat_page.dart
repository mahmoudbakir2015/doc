import 'package:doc/constant/style.dart';
import 'package:doc/presentation/chat/chat_page/items.dart';

import 'package:flutter/material.dart';
import '../../../constant/data_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController sendMessage = TextEditingController();
    bool tapped = false;
    return Scaffold(
      appBar: buildAppBar(
        videoCall: () {},
        context: context,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                Styles.appPadding,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return buildMessage(
                    message: message[index]['message'],
                    context: context,
                    date: message[index]['date'],
                    isMe: message[index]['isMe'],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: message.length,
              ),
            ),
          ),
          SendMessage(
            sendMessage: sendMessage,
            tapped: tapped,
          ),
        ],
      ),
    );
  }
}
