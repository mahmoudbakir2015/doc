import 'package:flutter/material.dart';

Row buildTextTile(
    {required String text,
    required void Function()? onTap,
    bool isSearch = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
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
          !isSearch ? 'See All' : 'Clear All History',
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
