import 'package:doc/constant/style.dart';
import 'package:doc/presentation/home/doctor_page/doctor_page.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/assets.dart';
import '../../../widgets/custom_search_filter.dart';
import '../../../widgets/custom_space.dart';
import '../../../widgets/doc_info.dart';

class RecommendationDoctor extends StatefulWidget {
  final String authorization;
  const RecommendationDoctor({super.key, required this.authorization});

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
              isMain: false,
              text: 'RecommendationDoctor',
              trailing: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(Assets.dots),
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
                          builder: (context) => DoctorPage(
                            id: 10,
                            authorization: widget.authorization,
                          ),
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
