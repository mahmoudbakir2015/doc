import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  Widget? trailing;
  final String text;
  bool isMain;
  bool isSearch;
  bool isProfile;
  void Function()? back;
  CustomListTile({
    Key? key,
    this.trailing,
    required this.text,
    this.isMain = true,
    this.isSearch = false,
    this.isProfile = false,
    this.back,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: isMain
          ? null
          : GestureDetector(
              onTap: back,
              child: const Icon(
                Icons.close,
              ),
            ),
      title: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isProfile ? Colors.white : const Color(0xFF242424),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      trailing: !isSearch ? trailing : null,
    );
  }
}
