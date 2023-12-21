import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant/assets.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_bold_text.dart';
import '../../home/doctor_page/items.dart';

AppBar buildAppBar({
  required Function() videoCall,
  required BuildContext context,
}) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Styles.borderRadius),
          ),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
    ),
    centerTitle: true,
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildBoldText(text: 'Dr. Randy Wigham'),
        buildLightText(text: 'Online'),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: GestureDetector(
          onTap: videoCall,
          child: SvgPicture.asset(
            Assets.videoCall,
          ),
        ),
      ),
    ],
  );
}
