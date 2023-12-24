import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Padding buildSettingTile({
  required String icon,
  required String name,
  void Function()? onTap,
  bool isLogout = false,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: SvgPicture.asset(
          icon,
          color: !isLogout ? Colors.black : Colors.red,
        ),
        title: Text(
          name,
          style: TextStyle(
            color: !isLogout ? const Color(0xFF242424) : Colors.red,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    ),
  );
}
