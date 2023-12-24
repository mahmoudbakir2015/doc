import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/assets.dart';
import '../../../widgets/custom_bold_text.dart';
import '../../../widgets/sub_text.dart';

Column buildAbout({
  required String aboutMe,
  required String workingTime,
  required String sTR,
  required String footer,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildBoldText(text: 'About me'),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: SubText(
          text: aboutMe,
        ),
      ),
      buildBoldText(
        text: 'Working Time',
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: SubText(
          text: workingTime,
        ),
      ),
      buildBoldText(
        text: 'STR',
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: SubText(
          text: sTR,
        ),
      ),
      buildBoldText(
        text: 'Pengalaman Praktik',
      ),
      buildBoldText(
        text: 'RSPAD Gatot Soebroto',
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: SubText(
          text: footer,
        ),
      ),
    ],
  );
}

Column buildLocation(
    {required String practicePlace, void Function()? location}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildBoldText(text: 'Practice Place'),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SubText(text: practicePlace),
      ),
      buildBoldText(text: 'Location Map'),
      Expanded(
        child: GestureDetector(
          onTap: location,
          child: const Image(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              Assets.mapPic,
            ),
          ),
        ),
      ),
    ],
  );
}

Row buildReviews({
  required String image,
  required String name,
  required String comment,
  required String date,
  required numOfStars,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            child: Image(
              image: NetworkImage(
                image,
              ),
              width: 50,
              height: 40,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF242424),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SubText(text: date),
              ],
            ),
            SizedBox(
              height: 20,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numOfStars,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return SvgPicture.asset(Assets.star);
                },
              ),
            ),
            SubText(text: comment),
          ],
        ),
      ),
    ],
  );
}
