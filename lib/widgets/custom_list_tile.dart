// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:doc/presentation/main_screen/main_screen.dart';

import '../core/cashe_helper.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  Widget? trailing;
  final String text;
  bool isMain;
  bool isSearch;
  bool isProfile;
  CustomListTile({
    Key? key,
    this.trailing,
    required this.text,
    this.isMain = true,
    this.isSearch = false,
    this.isProfile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: isMain
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MainScreen(
                              token:
                                  CacheHelper.getData(key: 'token').toString(),
                            )),
                    (route) => false);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: isProfile ? Colors.white : Colors.black,
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
