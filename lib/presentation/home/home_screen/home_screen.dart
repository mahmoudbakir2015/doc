import 'package:doc/constant/assets.dart';
import 'package:doc/presentation/home/home_screen/items.dart';
import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_speciality.dart';
import '../../../widgets/custom_text_tile.dart';
import '../../../widgets/doc_info.dart';
import '../doctor_page/doctor_page.dart';
import '../doctor_speciality/doctor_speciality.dart';
import '../notifications/notifications.dart';
import '../recommendation_doctor/recommendation_doctor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Styles.appPadding,
        right: Styles.appPadding,
        top: Styles.appPadding,
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotifiactionPage(),
                ),
              );
            },
            child: buildNotification(),
          ),
          const SizedBox(
            height: 30,
          ),
          buildFindNearby(),
          const SizedBox(
            height: 30,
          ),
          buildTextTile(
              mainText: 'Doctor Speciality',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DoctorSpeciality(),
                  ),
                );
              },
              subText: 'see All'),
          SizedBox(
            height: 120,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return buildSpeciality(
                  icon: Constants.doctorSpeciality[index]['icon'],
                  text: Constants.doctorSpeciality[index]['type'],
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  width: 25,
                );
              },
              itemCount: 4,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildTextTile(
              mainText: 'Recommendation Doctor',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RecommendationDoctor(),
                  ),
                );
              },
              subText: 'see All'),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DoctorPage(),
                      ),
                    );
                  },
                  child: buildDocInfo(
                    docPhoto: Assets.docImage,
                    name: 'Dr. Randy Wigham',
                    type: 'General',
                    description: 'RSUD Gatot Subroto',
                    rate: '4.8',
                    numReviews: '4,279',
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 5,
            ),
          ),
          Container(
            height: 40,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
