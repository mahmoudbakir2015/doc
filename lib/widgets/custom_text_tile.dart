import 'package:flutter/material.dart';

Row buildTextTile({
  required String mainText,
  required String subText,
  required void Function()? onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        mainText,
        style: const TextStyle(
          color: Color(0xFF242424),
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      GestureDetector(
        onTap: onTap,
        child: Text(
          subText,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF247CFF),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    ],
  );
}
