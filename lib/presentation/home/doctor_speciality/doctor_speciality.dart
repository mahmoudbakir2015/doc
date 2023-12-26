import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constant/constants.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_space.dart';
import '../../../widgets/custom_speciality.dart';

class DoctorSpeciality extends StatefulWidget {
  final String authorization;
  const DoctorSpeciality({super.key, required this.authorization});

  @override
  State<DoctorSpeciality> createState() => _DoctorSpecialityState();
}

class _DoctorSpecialityState extends State<DoctorSpeciality> {
  @override
  void initState() {
    BlocProvider.of<AppCubit>(context)
        .getAllSpecialization(authorization: widget.authorization);
    super.initState();
  }

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
