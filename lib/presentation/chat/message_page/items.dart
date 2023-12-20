import 'package:doc/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

ListTile buildNotificationCard({
  required String name,
  required String subDetails,
  required String message,
  required String date,
  required String notReaded,
  bool isNotifi = false,
  bool isMessage = true,
  String? image,
  String? icon,
}) {
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      child: isMessage
          ? Image(
              image: NetworkImage(
                image ?? Assets.docImage,
              ),
              width: 30,
            )
          : SvgPicture.asset(icon ?? Assets.clipboard),
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
        isMessage
            ? Container(
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
              )
            : CircleAvatar(
                backgroundColor: isNotifi ? Colors.red : Colors.white,
                radius: 5,
              ),
      ],
    ),
  );
}
