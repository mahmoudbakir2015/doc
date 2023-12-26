import 'package:doc/constant/style.dart';
import 'package:doc/core/cashe_helper.dart';
import 'package:doc/presentation/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant/assets.dart';
import '../../../widgets/custom_bold_text.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_space.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/doc_info.dart';

class RescheduleDetails extends StatelessWidget {
  final Map bookDetails;
  const RescheduleDetails({super.key, required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListTile(
              isMain: false,
              text: 'Details',
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    buildCustomSpace(context),
                    SvgPicture.asset(Assets.success),
                    const SizedBox(
                      width: 200,
                      height: 100,
                      child: Text(
                        'Booking has been rescheduled',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF242424),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            buildBoldText(text: 'Booking Information'),
            buildBooking(
              headText: 'Date & Time',
              subText: '${bookDetails['date']}',
              footText: '${bookDetails['available Time']} AM',
              icon: Assets.calender,
            ),
            buildBooking(
              headText: 'Appointment Type',
              subText: bookDetails['Appointment Type'],
              icon: Assets.clipboard,
              isDate: false,
            ),
            buildBoldText(text: 'Doctor Information'),
            buildDocInfo(
              docPhoto: Assets.docImage,
              name: 'Dr. Randy Wigham',
              type: 'General',
              description: 'RSUD Gatot Subroto',
              rate: '4.8',
              numReviews: '4,279',
            ),
            const Spacer(),
            DefaultButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MainScreen(
                      token: CacheHelper.getData(key: 'token').toString(),
                    ),
                  ),
                  (route) => false,
                );
              },
              text: 'Done',
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildBooking({
    bool isDate = true,
    String footText = '',
    required String headText,
    required String subText,
    required String icon,
    void Function()? getLink,
  }) {
    return ListTile(
      leading: CircleAvatar(
        child: SvgPicture.asset(icon),
      ),
      title: Text(
        headText,
        style: const TextStyle(
          color: Color(0xFF242424),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subText,
            style: const TextStyle(
              color: Color(0xFF757575),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.20,
            ),
          ),
          Text(
            footText,
            style: const TextStyle(
              color: Color(0xFF757575),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.20,
            ),
          )
        ],
      ),
      trailing: isDate
          ? null
          : TextButton(
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.blue,
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: getLink,
              child: const Text(
                'Get Link',
                style: TextStyle(
                  color: Color(0xFF247CFF),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    );
  }
}
