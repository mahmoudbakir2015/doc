import 'package:flutter/material.dart';

import '../../../../constant/style.dart';
import '../../../../widgets/sub_text.dart';

Padding buildFaq({
  required String header,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: Styles.appPadding,
      vertical: 10,
    ),
    child: ExpansionTile(
      title: Text(
        header,
        style: const TextStyle(
          color: Color(0xFF242424),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      children: [
        SubText(
          text: description,
        ),
      ],
    ),
  );
}
