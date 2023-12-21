import 'package:doc/constant/style.dart';
import 'package:doc/presentation/chat/chat_page/items.dart';
import 'package:doc/presentation/home/doctor_page/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant/assets.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
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
            const SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 45,
          right: Styles.appPadding,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: SizedBox(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            Assets.attachment,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            Assets.camera,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      Assets.smile,
                      color: Colors.grey,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  hintText: 'Type a message ...',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                controller: sendMessage,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: SvgPicture.asset(
                  Assets.mic,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar:
      // ,
    );
  }

  Column buildMessage({
    required String message,
    required BuildContext context,
    bool isMe = true,
    required String date,
  }) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 1.6,
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.white,
            borderRadius: isMe
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      Styles.borderRadius,
                    ),
                    topLeft: Radius.circular(
                      Styles.borderRadius,
                    ),
                    bottomRight: Radius.circular(
                      Styles.borderRadius,
                    ),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(
                      Styles.borderRadius,
                    ),
                    topLeft: Radius.circular(
                      Styles.borderRadius,
                    ),
                    bottomRight: Radius.circular(
                      Styles.borderRadius,
                    ),
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              ''''$message''',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        buildLightText(text: date),
      ],
    );
  }
}
