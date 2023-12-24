import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/custom_bold_text.dart';
import '../../../widgets/sub_text.dart';

ListTile buildCardPay({
  required String icon,
  required String name,
  required String last5dig,
}) {
  return ListTile(
    leading: SvgPicture.asset(icon),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildBoldText(text: name),
        SubText(text: '***** ***** ***** $last5dig'),
      ],
    ),
    trailing: const Text(
      'Connected',
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Color(0xFF247CFF),
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
