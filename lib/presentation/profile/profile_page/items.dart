import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/assets.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_list_tile.dart';

GestureDetector buildListTile(
    {required String text,
    required String icon,
    required void Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: SvgPicture.asset(icon),
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF242424),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}

Expanded buildChooseButton(
    {required String text,
    void Function()? onTap,
    required context,
    bool isAppointment = true}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.width * .11,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 247, 247),
          borderRadius: isAppointment
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF242424),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Positioned buildBar({required BuildContext context, void Function()? setting}) {
  return Positioned(
    top: MediaQuery.of(context).size.height * .04,
    right: 0,
    left: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
      child: CustomListTile(
        isProfile: true,
        text: 'profile',
        trailing: GestureDetector(
          onTap: setting,
          child: SvgPicture.asset(
            Assets.setting,
          ),
        ),
      ),
    ),
  );
}

Text buildEmail({required String email}) {
  return Text(
    email,
    style: const TextStyle(
      color: Color(0xFF242424),
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
  );
}

Text buildName({required String name}) {
  return Text(
    name,
    style: const TextStyle(
      color: Color(0xFF121212),
      fontSize: 20,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
  );
}
