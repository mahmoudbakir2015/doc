import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/my_appointment/my_appointment_screen/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/custom_list_tile.dart';

import '../reschedule/reschedule.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView>
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
    return Padding(
      padding: const EdgeInsets.only(
        left: Styles.appPadding,
        right: Styles.appPadding,
        top: Styles.appPadding,
      ),
      child: Column(
        children: [
          CustomListTile(
            text: 'My Appointment',
            trailing: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.search,
              ),
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
                  text: 'Upcoming',
                ),
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Cancelled',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // upcoming tab bar view widget
                ListView.separated(
                  itemBuilder: (ctx, index) {
                    return buildDocUpComing(
                      name: 'Dr. Randy Wigham',
                      subDetails: 'General Medical Checkup',
                      date: 'Wed, 17 May | 08.30 AM',
                      onCancel: () {},
                      onRechedule: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Reschedule(),
                          ),
                        );
                      },
                      chatTap: () {},
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      thickness: 0.5,
                    );
                  },
                  itemCount: 10,
                ),

                // completed tab bar view widget
                ListView.separated(
                  itemBuilder: (ctx, index) {
                    return buildStatusAppointment();
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      thickness: 0.5,
                    );
                  },
                  itemCount: 10,
                ),
                // canceled tab bar view widget
                ListView.separated(
                  itemBuilder: (ctx, index) {
                    return buildStatusAppointment(isCompleted: false);
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      thickness: 0.5,
                    );
                  },
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
