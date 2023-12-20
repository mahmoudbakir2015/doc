import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/assets.dart';
import '../../../widgets/doc_info.dart';

Padding buildDocUpComing({
  required String name,
  required String subDetails,
  required String date,
  String? image,
  void Function()? chatTap,
  required void Function() onCancel,
  required void Function() onRechedule,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0),
    child: Column(
      children: [
        ListTile(
          leading: Container(
            width: 100,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(6)),
            child: Image(
              fit: BoxFit.contain,
              image: NetworkImage(
                image ?? Assets.docImage,
              ),
              width: 100 / 3,
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
                child: SvgPicture.asset(
                  Assets.chat,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
                child: buildAppointmentButton(
              onPressed: onCancel,
            )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: buildAppointmentButton(
              isCancel: false,
              onPressed: onRechedule,
            )),
          ],
        ),
      ],
    ),
  );
}

ElevatedButton buildAppointmentButton(
    {bool isCancel = true, required void Function() onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        backgroundColor: isCancel ? Colors.white : Colors.blue,
        side: const BorderSide(color: Colors.blue)),
    child: Text(
      maxLines: 1,
      isCancel ? 'Cancel Appointment' : 'Reschedule',
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: isCancel ? Colors.blue : Colors.white,
        fontSize: 12,
      ),
    ),
  );
}

buildStatusAppointment({void Function()? onTap, bool isCompleted = true}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            isCompleted ? 'Appointment done' : 'Appointment cancelled',
            style: TextStyle(
              color: isCompleted
                  ? const Color(0xFF22C55E)
                  : const Color(0xFFFF4C5E),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.20,
            ),
          ),
          subtitle: const Row(
            children: [
              Text(
                'Wed, 17 May  | ',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.20,
                ),
              ),
              Text(
                '08.30 AM',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.20,
                ),
              )
            ],
          ),
          trailing: GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.list,
            ),
          ),
        ),
        buildDocInfo(
          docPhoto: Assets.docImage,
          name: 'Dr. Randy Wigham',
          type: 'General',
          description: 'RSUD Gatot Subroto',
          rate: '4.8',
          numReviews: '4,279',
        ),
      ],
    ),
  );
}
