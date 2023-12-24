import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constant/assets.dart';
import '../../../../constant/style.dart';

SizedBox buildSearch({required TextEditingController search}) {
  return SizedBox(
    height: 60,
    child: TextFormField(
      controller: search,
      decoration: InputDecoration(
        fillColor: const Color(0xFFF2F4F7),
        filled: true,
        prefixIcon: SvgPicture.asset(
          Assets.search,
          fit: BoxFit.scaleDown,
        ),
        hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Styles.borderRadius,
          ),
        ),
      ),
    ),
  );
}
