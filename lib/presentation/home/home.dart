import 'package:doc/constant/assets.dart';
import 'package:doc/presentation/home/items.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 40,
        ),
        buildNotification(),
        const SizedBox(
          height: 30,
        ),
        buildFindNearby(),
        const SizedBox(
          height: 30,
        ),
        buildTextTile(text: 'Doctor Speciality', onTap: () {}),
        SizedBox(
          height: 100,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return buildSpeciality(type: 'General', icon: Assets.apple);
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                width: 25,
              );
            },
            itemCount: 5,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildTextTile(text: 'Recommendation Doctor', onTap: () {}),
        Expanded(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return buildRecomDoctor(
                docPhoto: Assets.docImage,
                name: 'Dr. Randy Wigham',
                type: 'General',
                description: 'RSUD Gatot Subroto',
                rate: '4.8',
                numReviews: '4,279',
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
      ],
    );
  }
}
