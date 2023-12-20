import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/assets.dart';

Row buildDocInfo({
  bool isChat = false,
  void Function()? chatTap,
  String? docPhoto,
  required String name,
  required String description,
  required String type,
  required String rate,
  required String numReviews,
}) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          width: 90,
          height: 90,
          decoration: ShapeDecoration(
            color: Colors.grey,
            image: DecorationImage(
              alignment: Alignment.center,
              image: NetworkImage(docPhoto ?? Assets.docImage),
              fit: BoxFit.contain,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 4,
        child: Container(
          width: 110,
          height: 110,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.20,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(Assets.star),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$rate ($numReviews reviews)',
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 12,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      isChat
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: chatTap,
                    child: SvgPicture.asset(
                      Assets.chat,
                      color: Colors.blue,
                    ))
              ],
            )
          : const Text('')
    ],
  );
}
