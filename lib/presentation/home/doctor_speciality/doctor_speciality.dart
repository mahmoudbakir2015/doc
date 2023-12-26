import 'package:doc/constant/style.dart';
import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../data/model/home_model.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_space.dart';
import '../../../widgets/custom_speciality.dart';

class DoctorSpeciality extends StatelessWidget {
  final HomeModel homeModel;
  // final String authorization;
  const DoctorSpeciality({super.key, required this.homeModel});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Column(
          children: [
            CustomListTile(
              text: 'Doctor Speciality',
            ),
            buildCustomSpace(context),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeModel.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: buildSpeciality(
                      icon: Constants.doctorSpeciality[index]['icon'],
                      text: homeModel.data![index].name.toString(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
