import 'package:doc/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/assets.dart';

class CustomSearchFilter extends StatelessWidget {
  const CustomSearchFilter({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 14,
          child: defaultTextForm(
              widget: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                Assets.search,
              ),
              label: 'Search',
              controller: controller,
              onValidate: (String? value) {},
              textInputType: TextInputType.text),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.filter_list,
          ),
        ),
      ],
    );
  }
}
