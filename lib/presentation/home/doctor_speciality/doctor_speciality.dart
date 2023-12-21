import 'package:doc/constant/style.dart';
import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_space.dart';
import '../../../widgets/custom_speciality.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

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
                itemCount: Constants.doctorSpeciality.length,
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
                      text: Constants.doctorSpeciality[index]['type'],
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
