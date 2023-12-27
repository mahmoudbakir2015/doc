import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/constant/style.dart';
import 'package:flutter/material.dart';
import '../../../constant/assets.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../chat/message_page/items.dart';

class NotifiactionPage extends StatelessWidget {
  const NotifiactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: ListView(
          children: [
            CustomListTile(
              isMain: false,
              back: () {
                Navigator.pop(context);
                cubit.changeNav(tap: 0);
              },
              text: 'Notification',
              trailing: buildNotifCount(count: '3'),
            ),
            buildNotificationTime(
              time: 'Today',
              isNotToday: false,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return buildNotificationCard(
                  isNotifi: true,
                  isMessage: false,
                  icon: Assets.diagnostic,
                  name: 'Dr. Randy Wigham',
                  subDetails: 'General Doctor | RSUD Gatot Subroto',
                  message:
                      '''Fine, I'll do a check. Does the patient have a history of certain diseases?''',
                  date: '7:11 PM',
                  notReaded: '2',
                  image: Assets.docImage,
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: 3,
            ),
            buildNotificationTime(time: 'Yesterday'),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return buildNotificationCard(
                  isMessage: false,
                  name: 'Dr. Randy Wigham',
                  subDetails: 'General Doctor | RSUD Gatot Subroto',
                  message:
                      '''Fine, I'll do a check. Does the patient have a history of certain diseases?''',
                  date: '7:11 PM',
                  notReaded: '2',
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildNotificationTime(
      {required String time, bool isNotToday = true}) {
    return ListTile(
      leading: Text(
        time,
        style: const TextStyle(
          color: Color(0xFF9E9E9E),
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: !isNotToday
          ? GestureDetector(
              onTap: () {},
              child: const Text(
                'Mark all as read',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF247CFF),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                ),
              ),
            )
          : null,
    );
  }

  Container buildNotifCount({required String count}) {
    return Container(
      height: 40,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Styles.borderRadius),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          '$count NEW',
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
