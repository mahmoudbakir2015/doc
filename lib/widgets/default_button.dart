import 'package:flutter/material.dart';

import '../constant/style.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Styles.borderRadius)),
          backgroundColor: const Color(0xff247CFF),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
