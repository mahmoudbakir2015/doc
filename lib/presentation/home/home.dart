import 'package:doc/constant/assets.dart';
import 'package:doc/presentation/home/items.dart';
import 'package:flutter/material.dart';
import '../../constant/style.dart';
import '../../widgets/custom_text_tile.dart';
import '../../widgets/doc_info.dart';

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
          buildNotification(),
          const SizedBox(
            height: 30,
          ),
          buildFindNearby(),
          const SizedBox(
            height: 30,
          ),
          buildTextTile(
              mainText: 'Doctor Speciality', onTap: () {}, subText: 'see All'),
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
          buildTextTile(
              mainText: 'Recommendation Doctor',
              onTap: () {},
              subText: 'see All'),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {},
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
