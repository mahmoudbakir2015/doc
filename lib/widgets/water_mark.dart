import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/assets.dart';

class WaterMark extends StatelessWidget {
  const WaterMark({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.icon,
      height: double.infinity,

      color: const Color.fromARGB(255, 242, 243, 244),
      // Color.fromARGB(6, 71, 92, 123),
    );
  }
}
