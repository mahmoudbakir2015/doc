import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/constant/style.dart';
import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../data/model/home_model.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_space.dart';
import '../../../widgets/custom_speciality.dart';

class DoctorSpeciality extends StatelessWidget {
  final HomeModel homeModel;
  const DoctorSpeciality({super.key, required this.homeModel});

  // @override
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Column(
          children: [
            CustomListTile(
              isMain: false,
              back: () {
                Navigator.pop(context);
                cubit.changeNav(tap: 0);
              },
              text: 'Doctor Speciality',
            ),
            buildCustomSpace(context),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeModel.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
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
