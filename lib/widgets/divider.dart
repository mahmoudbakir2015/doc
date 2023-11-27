import 'package:flutter/material.dart';

Row buildOrDivider({bool isLogined = true}) {
  return Row(
    children: [
      const Expanded(child: Divider()),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          isLogined ? 'Or Sign In with' : 'Or Sign Up with',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        ),
      ),
      const Expanded(child: Divider()),
    ],
  );
}
