import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/assets.dart';

SizedBox buildDocContainer({
  required String name,
  required String subDetails,
  required String date,
  String? image,
  void Function()? chatTap,
}) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      children: [
        ListTile(
          leading: Container(
            width: 90,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(6)),
            child: Image(
              fit: BoxFit.contain,
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
                date,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: chatTap,
                  child: SvgPicture.asset(Assets.chat, color: Colors.blue)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(child: buildAppointmentButton()),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: buildAppointmentButton(isCancel: false)),
            ],
          ),
        ),
      ],
    ),
  );
}

ElevatedButton buildAppointmentButton({bool isCancel = true}) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        backgroundColor: isCancel ? Colors.white : Colors.blue,
        side: const BorderSide(color: Colors.blue)),
    child: Text(
      isCancel ? 'Cancel Appointment' : 'Reschedule',
      style: TextStyle(
        color: isCancel ? Colors.blue : Colors.white,
      ),
    ),
  );
}
