// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/assets.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_bold_text.dart';
import '../../home/doctor_page/items.dart';

AppBar buildAppBar({
  required Function() videoCall,
  required BuildContext context,
}) {
  return AppBar(
    leadingWidth: 100,
    leading: buildContainerIcon(
      context: context,
      isVideoCall: false,
    ),
    centerTitle: true,
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildBoldText(text: 'Dr. Randy Wigham'),
        buildLightText(text: 'Online'),
      ],
    ),
    actions: [
      buildContainerIcon(
        onTap: videoCall,
        context: context,
      ),
    ],
  );
}

Padding buildContainerIcon(
    {bool isVideoCall = true,
    void Function()? onTap,
    required BuildContext context}) {
  return Padding(
    padding: isVideoCall
        ? const EdgeInsets.symmetric(horizontal: Styles.appPadding)
        : const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: Styles.appPadding,
          ),
    child: GestureDetector(
      onTap: isVideoCall
          ? onTap
          : () {
              Navigator.pop(context);
            },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: SvgPicture.asset(
          isVideoCall ? Assets.videoCall : Assets.back,
          color: Colors.black,
          fit: BoxFit.scaleDown,
        ),
      ),
    ),
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

// ignore: must_be_immutable
class SendMessage extends StatefulWidget {
  final TextEditingController sendMessage;
  bool tapped;
  SendMessage({
    Key? key,
    required this.sendMessage,
    this.tapped = false,
  }) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Styles.appPadding,
          bottom: Styles.appPadding,
          right: Styles.appPadding),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onTap: () {
                widget.tapped = true;

                setState(() {});
              },
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
              controller: widget.sendMessage,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              if (widget.tapped) {
                print('sended');
                widget.tapped = false;

                setState(() {});
              } else {
                print('microPhone');
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: SvgPicture.asset(
                widget.tapped ? Assets.send : Assets.mic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
