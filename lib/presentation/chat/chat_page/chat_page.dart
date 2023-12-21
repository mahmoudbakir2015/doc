import 'package:doc/constant/style.dart';
import 'package:doc/presentation/chat/chat_page/items.dart';

import 'package:flutter/material.dart';
import '../../../constant/data_message.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController sendMessage = TextEditingController();
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
          buildSendMessage(sendMessage),
        ],
      ),
    );
  }
}
