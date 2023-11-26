import 'package:flutter/material.dart';

class SubText extends StatelessWidget {
  final String text;
  const SubText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      style: const TextStyle(
        color: Color(0xFF757575),
        fontSize: 14,
        fontFamily: 'Inter',
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.20,
      ),
    );
  }
}
