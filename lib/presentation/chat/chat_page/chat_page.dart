import 'package:doc/constant/style.dart';
import 'package:doc/data/model/doctor_model.dart';
import 'package:doc/presentation/chat/chat_page/items.dart';

import 'package:flutter/material.dart';
import '../../../constant/data_message.dart';
import '../video_call/video_call.dart';

class ChatPage extends StatelessWidget {
  final DoctorModel doctorModel;
  const ChatPage({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        actionTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const VideoCall(),
            ),
          );
        },
        context: context,
        name: doctorModel.data!.name.toString(),
        status: 'Online',
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
          const SendMessage(),
        ],
      ),
    );
  }
}
