import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RememberForget extends StatefulWidget {
  bool checkValue;
  RememberForget({super.key, required this.checkValue});

  @override
  State<RememberForget> createState() => _RememberForgetState();
}

class _RememberForgetState extends State<RememberForget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: widget.checkValue,
            onChanged: (bool? vale) {
              widget.checkValue = !widget.checkValue;
              setState(() {});
            }),
        const Text(
          'Remember me',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Spacer(),
        const Text(
          'Forgot Password?',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF247CFF),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        )
      ],
    );
  }
}
