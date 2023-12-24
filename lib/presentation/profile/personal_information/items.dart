import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/assets.dart';

Padding buildEditForm(
    {required TextEditingController? controller,
    String? Function(String?)? validator}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
    ),
  );
}

GestureDetector buildEditPic({
  required void Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(
      children: [
        const CircleAvatar(
          radius: 70,
          child: Image(
            height: 100,
            width: 100,
            fit: BoxFit.scaleDown,
            image: NetworkImage(
              Assets.docImage,
            ),
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              backgroundColor: const Color(0xFFF2F4F7),
              child: SvgPicture.asset(
                Assets.edit,
              ),
            ))
      ],
    ),
  );
}
