// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constant/style.dart';

// ignore: must_be_immutable
class SwitchIcon extends StatefulWidget {
  final String text;
  bool switchValue;
  SwitchIcon({
    super.key,
    this.switchValue = true,
    required this.text,
  });

  @override
  State<SwitchIcon> createState() => _SwitchIconState();
}

class _SwitchIconState extends State<SwitchIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Styles.appPadding,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              color: Color(0xFF242424),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          CupertinoSwitch(
            activeColor: Colors.blue,
            value: widget.switchValue,
            onChanged: (value) {
              setState(() {
                widget.switchValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
