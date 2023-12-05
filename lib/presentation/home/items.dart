import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/assets.dart';
import '../../constant/style.dart';

Row buildNotification() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, Mahmoud!',
            style: TextStyle(
              color: Color(0xFF242424),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'How Are you Today?',
            style: TextStyle(
              color: Color(0xFF616161),
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      CircleAvatar(
        backgroundColor: Color(0xFFF5F5F5),
        child: Center(
          child: Stack(
            children: [
              Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 25,
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Container buildFindNearby() {
  return Container(
    width: double.infinity,
    height: 167,
    decoration: ShapeDecoration(
      color: const Color(0xFF247CFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Styles.appPadding),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 150,
                child: Text(
                  'Book and schedule with nearest doctor ',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text(
                  'Find Nearby',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0,
                left: 0,
                top: -40,
                bottom: 0,
                child: Image.network(
                  Assets.docImage,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Row buildRecomDoctor({
  required String docPhoto,
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
          width: 110,
          height: 110,
          decoration: ShapeDecoration(
            image: DecorationImage(
              alignment: Alignment.center,
              image: NetworkImage(docPhoto),
              fit: BoxFit.contain,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
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
    ],
  );
}

SizedBox buildSpeciality({required String type, required String icon}) {
  return SizedBox(
    height: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: const Color(0xFFF4F8FF),
          child: Center(
            child: SvgPicture.asset(
              icon,
            ),
          ),
        ),
        Text(
          type,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF242424),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        ),
      ],
    ),
  );
}

Row buildTextTile({required String text, required void Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: const TextStyle(
          color: Color(0xFF242424),
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      GestureDetector(
        onTap: onTap,
        child: const Text(
          'See All',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF247CFF),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    ],
  );
}
