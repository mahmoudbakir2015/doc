import 'package:flutter/material.dart';

Text buildTermsAndConditions() {
  return const Text.rich(
    textAlign: TextAlign.center,
    maxLines: 2,
    TextSpan(
      children: [
        TextSpan(
          text: 'By logging, you agree to our',
          style: TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextSpan(
          text: 'Terms & Conditions',
          style: TextStyle(
            color: Color(0xFF242424),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: 'and',
          style: TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextSpan(
          text: 'PrivacyPolicy.',
          style: TextStyle(
            color: Color(0xFF242424),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
