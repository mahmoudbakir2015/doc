import 'package:doc/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

buildIconNav({
  required String icon,
  required void Function() onTap,
  Color? color,
  bool isProfile = false,
  String? image,
}) {
  return SizedBox(
    width: 30,
    height: 60,
    child: GestureDetector(
      onTap: onTap,
      child: !isProfile
          ? SvgPicture.asset(
              icon,
              height: 35,
              color: color,
            )
          : CircleAvatar(
              backgroundImage: NetworkImage(
                image ?? Assets.docImage,
              ),
            ),
    ),
  );
}

Container buildFloating() {
  return Container(
    width: 72,
    height: 72,
    decoration: ShapeDecoration(
      color: const Color(0xFF247CFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27.92),
      ),
    ),
    child: Center(
      child: SvgPicture.asset(
        Assets.search,
        color: Colors.white,
      ),
    ),
  );
}
