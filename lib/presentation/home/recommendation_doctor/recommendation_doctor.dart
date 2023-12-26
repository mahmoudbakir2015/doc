import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/business_logic/cubit/home_cubit/home_states.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/home/doctor_page/doctor_page.dart';
import 'package:doc/presentation/main_screen/main_screen.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/assets.dart';
import '../../../widgets/custom_search_filter.dart';
import '../../../widgets/custom_space.dart';
import '../../../widgets/doc_info.dart';

class RecommendationDoctor extends StatefulWidget {
  final String token;
  const RecommendationDoctor({super.key, required this.token});

  @override
  State<RecommendationDoctor> createState() => _RecommendationDoctorState();
}

class _RecommendationDoctorState extends State<RecommendationDoctor> {
  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getAllDoctors(
      authorization: widget.token,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchControl = TextEditingController();

    return Scaffold(
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          if (state is SuccessedGetAllDocState) {
            return Padding(
              padding: const EdgeInsets.only(
                top: Styles.appPadding,
                left: Styles.appPadding,
                right: Styles.appPadding,
              ),
              child: Column(
                children: [
                  CustomListTile(
                    isMain: false,
                    back: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                              token: widget.token,
                            ),
                          ),
                          (route) => false);
                    },
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
                                  id: state.allDoctorModel.data![index].id!
                                      .toInt(),
                                  token: widget.token,
                                ),
                              ),
                            );
                          },
                          child: buildDocInfo(
                            docPhoto: state.allDoctorModel.data![index].photo
                                .toString(),
                            name: state.allDoctorModel.data![index].name
                                .toString(),
                            type: state.allDoctorModel.data![index]
                                .specialization!.name
                                .toString(),
                            description: state
                                .allDoctorModel.data![index].degree
                                .toString(),
                            rate: (state.allDoctorModel.data![index]
                                        .appointPrice!
                                        .toInt() /
                                    100)
                                .toString(),
                            numReviews: state
                                .allDoctorModel.data![index].appointPrice
                                .toString(),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: state.allDoctorModel.data!.length,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('please wait'),
            );
          }
        },
      ),
    );
  }
}
