// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:doc/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/style.dart';

class CustomChooseTile extends StatelessWidget {
  final String text;
  final String icon;
  final int choose;
  int active;
  CustomChooseTile({
    Key? key,
    required this.text,
    required this.icon,
    this.active = 0,
    required this.choose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: SvgPicture.asset(icon),
      ),
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

Container buildDate({
  required int index,
  required int currentDateSelectedIndex,
  required List listOfMonths,
  required List listOfDays,
}) {
  return Container(
    width: 80,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Styles.borderRadius),
        color: currentDateSelectedIndex == index
            ? Colors.blue
            : const Color(0xFFF2F4F7)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          listOfMonths[DateTime.now().add(Duration(days: index)).month - 1]
              .toString(),
          style: TextStyle(
              fontSize: 16,
              color: currentDateSelectedIndex == index
                  ? Colors.white
                  : Colors.grey),
        ),
        Text(
          DateTime.now().add(Duration(days: index)).day.toString(),
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: currentDateSelectedIndex == index
                  ? Colors.white
                  : Colors.grey),
        ),
        Text(
          listOfDays[DateTime.now().add(Duration(days: index)).weekday - 1]
              .toString(),
          style: TextStyle(
              fontSize: 16,
              color: currentDateSelectedIndex == index
                  ? Colors.white
                  : Colors.grey),
        ),
      ],
    ),
  );
}
