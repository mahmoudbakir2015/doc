import 'package:flutter/material.dart';
import '../../../constant/style.dart';

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
