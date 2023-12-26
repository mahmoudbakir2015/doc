import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/business_logic/cubit/home_cubit/home_states.dart';
import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/home/doctor_page/items.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:doc/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/doc_info.dart';
import '../../chat/chat_page/chat_page.dart';

class DoctorPage extends StatefulWidget {
  final int id;
  final String authorization;
  const DoctorPage({super.key, required this.id, required this.authorization});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    BlocProvider.of<AppCubit>(context)
        .showDoc(authorization: widget.authorization, id: widget.id);
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          if (state is SuccessedShowDocState) {
            return Padding(
              padding: const EdgeInsets.all(Styles.appPadding),
              child: Column(
                children: [
                  CustomListTile(
                    text: state.doctorModel.data!.name.toString(),
                    trailing: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.dots),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: buildDocInfo(
                      chatTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              doctorModel: state.doctorModel,
                            ),
                          ),
                        );
                      },
                      isChat: true,
                      docPhoto: state.doctorModel.data!.photo,
                      name: state.doctorModel.data!.name.toString(),
                      description: state.doctorModel.data!.degree.toString(),
                      type: state.doctorModel.data!.specialization!.name
                          .toString(),
                      rate:
                          (state.doctorModel.data!.appointPrice!.toInt() / 100)
                              .toString(),
                      numReviews:
                          state.doctorModel.data!.appointPrice.toString(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.blue,
                      controller: _tabController,
                      labelColor: Colors.blue,
                      unselectedLabelColor: const Color(0xFF9E9E9E),
                      tabs: const [
                        Tab(
                          text: 'About',
                        ),
                        Tab(
                          text: 'Location',
                        ),
                        Tab(
                          text: 'Reviews',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        //about
                        buildAbout(
                          aboutMe:
                              'Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.',
                          workingTime:
                              'Monday - Friday, ${state.doctorModel.data!.startTime} - ${state.doctorModel.data!.endTime}',
                          sTR: state.doctorModel.data!.phone.toString(),
                          footer: '2017 - sekarang',
                        ),
                        //Location
                        buildLocation(
                          practicePlace:
                              state.doctorModel.data!.address.toString(),
                          location: () {},
                        ),
                        //Reviews
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (ctx, index) {
                              return buildReviews(
                                image: Assets.docImage,
                                name: 'Jane Cooper',
                                comment:
                                    'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.',
                                date: 'Today',
                                numOfStars: 4,
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DefaultButton(
                    onPressed: () {},
                    text: 'Make An Appointment',
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('please wait Or Some thing went Wrong...!'),
            );
          }
        },
      ),
    );
  }
}
