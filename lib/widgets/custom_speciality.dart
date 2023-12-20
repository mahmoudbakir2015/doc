import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Column buildSpeciality({required String icon, required String text}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 40,
        backgroundColor: const Color(0x0C247CFF),
        child: SvgPicture.asset(
          icon,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF242424),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
