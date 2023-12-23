import 'package:doc/constant/style.dart';
import 'package:doc/presentation/home/doctor_page/doctor_page.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import '../../../constant/assets.dart';
import '../../../widgets/custom_search_filter.dart';
import '../../../widgets/custom_space.dart';
import '../../../widgets/doc_info.dart';

class RecommendationDoctor extends StatefulWidget {
  const RecommendationDoctor({super.key});

  @override
  State<RecommendationDoctor> createState() => _RecommendationDoctorState();
}

class _RecommendationDoctorState extends State<RecommendationDoctor> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchControl = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: Styles.appPadding,
          left: Styles.appPadding,
          right: Styles.appPadding,
        ),
        child: Column(
          children: [
            CustomListTile(
              text: 'RecommendationDoctor',
              trailing: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.edit),
              ),
            ),
            buildCustomSpace(context),
            CustomSearchFilter(
              controller: searchControl,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
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
                    height: 20,
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
