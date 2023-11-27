import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

GestureDetector buildSocialLogin({
  required String icon,
  Function()? onTap,
}) {
  return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
      ));
}
