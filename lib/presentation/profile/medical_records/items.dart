import 'package:flutter/material.dart';

import '../../../constant/style.dart';
import '../../../widgets/custom_bold_text.dart';
import '../../../widgets/sub_text.dart';

Expanded buildRecord(
    {required String date, required String typeRecord, required List details}) {
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubText(text: date),
        const SizedBox(
          width: Styles.appPadding,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildBoldText(text: typeRecord),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: details.length,
                itemBuilder: (ctx, index) {
                  return SubText(text: details[index]);
                },
              ),
            ],
          ),
        )
      ],
    ),
  );
}
