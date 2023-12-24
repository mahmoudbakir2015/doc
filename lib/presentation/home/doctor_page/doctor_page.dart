import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/home/doctor_page/items.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:doc/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/doc_info.dart';
import '../../chat/chat_page/chat_page.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
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
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Column(
          children: [
            CustomListTile(
              isMain: false,
              text: 'Dr Randy Wigham',
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
                      builder: (context) => const ChatPage(),
                    ),
                  );
                },
                isChat: true,
                name: 'Dr Randy Wigham',
                description: 'RSUD Gatot Subroto',
                type: 'General',
                rate: '4.9',
                numReviews: '4.279',
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
                    workingTime: 'Monday - Friday, 08.00 AM - 20.00 PM',
                    sTR: '4726482464',
                    footer: '2017 - sekarang',
                  ),
                  //Location
                  buildLocation(
                    practicePlace: 'Cairo, Egypt',
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
      ),
    );
  }
}
