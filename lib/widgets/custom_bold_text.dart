import 'package:flutter/material.dart';

Text buildBoldText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFF242424),
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
  );
}
