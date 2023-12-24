import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/assets.dart';
import '../../../constant/style.dart';

InkWell buildFooterButton({
  void Function()? onTap,
  required String icon,
  bool isClose = false,
}) {
  return InkWell(
    onTap: onTap,
    child: CircleAvatar(
      backgroundColor: isClose ? Colors.red : const Color(0x51F0F0F0),
      radius: 30,
      child: SvgPicture.asset(
        icon,
        color: Colors.white,
      ),
    ),
  );
}

Positioned buildHisImage({
  required BuildContext context,
  required String image,
}) {
  return Positioned(
    top: Styles.appPadding + 30,
    right: Styles.appPadding,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Image(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.3,
        fit: BoxFit.fitHeight,
        image: NetworkImage(image),
      ),
    ),
  );
}

Positioned buildBack(BuildContext context) {
  return Positioned(
    top: Styles.appPadding + 30,
    left: Styles.appPadding,
    child: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset(
          Assets.back,
          fit: BoxFit.scaleDown,
        ),
      ),
    ),
  );
}

Expanded buildYourImage({
  required BuildContext context,
  required String image,
}) {
  return Expanded(
    child: Image(
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.fitHeight,
      image: NetworkImage(
        image,
      ),
    ),
  );
}
