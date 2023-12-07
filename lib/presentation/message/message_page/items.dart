import 'package:doc/constant/assets.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text_form.dart';

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
              iconData: Icons.search,
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

ListTile buildDocCard({
  required String name,
  required String subDetails,
  required String message,
  required String date,
  required String notReaded,
  String? image,
}) {
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      child: Image(
        image: NetworkImage(
          image ?? Assets.docImage,
        ),
        width: 30,
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Color(0xFF242424),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            subDetails,
            style: const TextStyle(
              color: Color(0xFF616161),
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          message,
          style: const TextStyle(
            color: Color(0xFF757575),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          maxLines: 3,
        ),
      ],
    ),
    trailing: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          date,
          style: const TextStyle(
            color: Color(0xFF757575),
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          width: 25,
          height: 25,
          decoration: ShapeDecoration(
            color: const Color(0xFF247CFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Center(
            child: Text(
              notReaded,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
