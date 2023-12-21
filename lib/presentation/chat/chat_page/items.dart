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
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Styles.borderRadius),
          ),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: GestureDetector(
          onTap: videoCall,
          child: SvgPicture.asset(
            Assets.videoCall,
          ),
        ),
      ),
    ],
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

Padding buildSendMessage(TextEditingController sendMessage) {
  return Padding(
    padding: const EdgeInsets.only(
        left: Styles.appPadding,
        bottom: Styles.appPadding,
        right: Styles.appPadding),
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
  );
}
