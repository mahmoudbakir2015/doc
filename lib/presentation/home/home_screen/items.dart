import 'package:flutter/material.dart';
import '../../../constant/assets.dart';
import '../../../constant/style.dart';

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

Container buildFindNearby({
  void Function()? findNearby,
}) {
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
                onPressed: findNearby,
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
