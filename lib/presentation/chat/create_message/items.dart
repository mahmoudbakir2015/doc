import 'package:flutter/material.dart';
import '../../../widgets/custom_bold_text.dart';
import '../../home/doctor_page/items.dart';

Row buildCreateSearchedDoc({
  required String image,
  required String name,
  required String description,
}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 30,
        child: Image(
          fit: BoxFit.scaleDown,
          image: NetworkImage(
            image,
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBoldText(text: name),
          buildLightText(text: description),
        ],
      )
    ],
  );
}
