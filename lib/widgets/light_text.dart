import 'package:flutter/material.dart';

class LightText extends StatelessWidget {
  final String text;
  const LightText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,
      text,
      style: const TextStyle(
        color: Color(0xFF247CFF),
        fontSize: 24,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
