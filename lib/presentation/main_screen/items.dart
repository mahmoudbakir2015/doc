import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

buildIconNav({required String icon, required void Function() onTap}) {
  return SizedBox(
    width: 30,
    height: 60,
    child: GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        height: 35,
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
    child: const Center(
      child: Icon(
        Icons.search,
        color: Colors.white,
      ),
    ),
  );
}
