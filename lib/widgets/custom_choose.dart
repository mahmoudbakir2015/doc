import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/assets.dart';
import '../constant/style.dart';

Container buildChoose({
  bool isRating = false,
  required int index,
  required String text,
  int choose = 0,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Styles.borderRadius),
      color: choose == index ? Colors.blue : const Color(0xFFF2F4F7),
    ),
    child: Center(
      child: !isRating
          ? Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: choose == index ? Colors.white : const Color(0xFFC2C2C2),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  Assets.star,
                  color: choose == index ? Colors.white : Colors.grey,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: choose == index
                        ? Colors.white
                        : const Color(0xFFC2C2C2),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
    ),
  );
}
