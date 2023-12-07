import 'package:doc/presentation/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  Widget? trailing;
  final String text;
  bool isMain;
  CustomListTile({
    super.key,
    this.trailing,
    this.isMain = true,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: isMain
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                    (route) => false);
              },
              child: const Icon(
                Icons.arrow_back_ios,
              ),
            )
          : GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
              ),
            ),
      title: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF242424),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      trailing: trailing,
    );
  }
}
