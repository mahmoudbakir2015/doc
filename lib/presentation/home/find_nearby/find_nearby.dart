import 'package:doc/constant/style.dart';
import 'package:doc/presentation/home/doctor_page/doctor_page.dart';
import 'package:doc/presentation/home/find_nearby/items.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class FindNeaby extends StatelessWidget {
  final String authorization;
  const FindNeaby({super.key, required this.authorization});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: Styles.appPadding,
              left: Styles.appPadding,
              right: Styles.appPadding,
            ),
            child: CustomListTile(text: 'Find Nearby'),
          ),
          Stack(
            children: [
              buildMap(context),
              buildDocCard(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DoctorPage(
                            id: 10,
                            authorization: authorization,
                          )));
                },
                name: 'Dr. Randy Wigham',
                description: 'RSUD Gatot Subroto',
                type: 'General',
                rate: '4.8',
                numReviews: '4,729',
              ),
              buildSearch(
                controller: search,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
