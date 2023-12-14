import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/calender/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom_list_tile.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView>
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
      padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
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
                // first tab bar view widget
                ListView.separated(
                  itemBuilder: (ctx, index) {
                    return buildDocContainer(
                        name: 'Dr. Randy Wigham',
                        subDetails: 'General Medical Checkup',
                        date: 'Wed, 17 May | 08.30 AM');
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      thickness: 0.5,
                    );
                  },
                  itemCount: 10,
                ),

                // second tab bar view widget
                ListView.separated(
                  itemBuilder: (ctx, index) {
                    return buildDocContainer(
                        name: 'Dr. Randy Wigham',
                        subDetails: 'General Medical Checkup',
                        date: 'Wed, 17 May | 08.30 AM');
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      thickness: 0.5,
                    );
                  },
                  itemCount: 10,
                ),
                // Third tab bar view widget
                ListView.separated(
                  itemBuilder: (ctx, index) {
                    return buildDocContainer(
                        name: 'Dr. Randy Wigham',
                        subDetails: 'General Medical Checkup',
                        date: 'Wed, 17 May | 08.30 AM');
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
