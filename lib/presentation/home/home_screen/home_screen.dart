import 'package:doc/business_logic/cubit/home_cubit/home_states.dart';
import 'package:doc/constant/assets.dart';
import 'package:doc/presentation/home/find_nearby/find_nearby.dart';
import 'package:doc/presentation/home/home_screen/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubit/home_cubit/home_cubit.dart';
import '../../../constant/constants.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_speciality.dart';
import '../../../widgets/custom_text_tile.dart';
import '../../../widgets/doc_info.dart';
import '../doctor_page/doctor_page.dart';
import '../doctor_speciality/doctor_speciality.dart';
import '../notifications/notifications.dart';
import '../recommendation_doctor/recommendation_doctor.dart';

class Home extends StatefulWidget {
  final String authorization;
  const Home({super.key, required this.authorization});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context)
        .getData(authorization: widget.authorization);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialHomeState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SuccessedHomeState) {
          return Padding(
            padding: const EdgeInsets.only(
              left: Styles.appPadding,
              right: Styles.appPadding,
              top: Styles.appPadding,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                buildNotification(
                  name: 'Mahmoud',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NotifiactionPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                buildFindNearby(
                  findNearby: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FindNeaby(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                buildTextTile(
                    mainText: 'Doctor Speciality',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DoctorSpeciality(
                            // authorization: widget.authorization,
                            homeModel: state.homeModel,
                          ),
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
                        text: state.homeModel.data![index].name.toString(),
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
                          docPhoto:
                              state.homeModel.data![index].doctors![0].photo,
                          name: state.homeModel.data![index].doctors![0].name
                              .toString(),
                          type: state.homeModel.data![index].doctors![0]
                              .specialization!.name
                              .toString(),
                          description: state
                              .homeModel.data![index].doctors![0].description
                              .toString(),
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
                    itemCount: state.homeModel.data!.length,
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.transparent,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('some thing went Wrong...!!!'),
          );
        }
      },
    );
  }
}
