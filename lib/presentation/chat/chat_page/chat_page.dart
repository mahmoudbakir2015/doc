import 'package:doc/presentation/chat/chat_page/items.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        videoCall: () {},
        context: context,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
