// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/assets.dart';

// ignore: must_be_immutable
class CustomChooseTile extends StatelessWidget {
  bool isLeading;
  final String text;
  String icon;
  final int choose;
  int active;
  CustomChooseTile({
    Key? key,
    required this.text,
    this.isLeading = false,
    this.icon = Assets.attachment,
    this.active = 0,
    required this.choose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isLeading
          ? CircleAvatar(
              child: SvgPicture.asset(icon),
            )
          : null,
      title: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF242424),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: CircleAvatar(
        radius: 12,
        backgroundColor: Colors.blueGrey[50],
        child: active == choose
            ? const CircleAvatar(
                radius: 8,
                backgroundColor: Colors.blue,
              )
            : null,
      ),
    );
  }
}
