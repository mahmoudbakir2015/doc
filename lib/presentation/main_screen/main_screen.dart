import 'package:doc/constant/style.dart';
import 'package:doc/presentation/main_screen/items.dart';
import 'package:flutter/material.dart';

import '../../constant/assets.dart';
import '../my_appointment/calender/calender.dart';
import '../home/home.dart';
import '../message/message_page/messages_page.dart';
import '../profile/profile.dart';
import '../search/search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screen = [
    const Home(),
    MessagesView(),
    SearchView(),
    const CalenderView(),
    const ProfilePage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: Row(
          children: [
            buildIconNav(
                color: index == 0 ? Colors.blue : Colors.black,
                icon: Assets.home,
                onTap: () {
                  index = 0;
                  setState(() {});
                }),
            const Spacer(flex: 1),
            buildIconNav(
                color: index == 1 ? Colors.blue : Colors.black,
                icon: Assets.chat,
                onTap: () {
                  index = 1;
                  setState(() {});
                }),
            const Spacer(
              flex: 2,
            ),
            buildIconNav(
                color: index == 3 ? Colors.blue : Colors.black,
                icon: Assets.calender,
                onTap: () {
                  index = 3;
                  setState(() {});
                }),
            const Spacer(
              flex: 1,
            ),
            buildIconNav(
                image:
                    'https://th.bing.com/th/id/OIP.4siKIW3oZ4kEo0vkEVQ5hgHaLH?rs=1&pid=ImgDetMain',
                isProfile: true,
                color: index == 4 ? Colors.blue : Colors.black,
                icon: Assets.home,
                onTap: () {
                  index = 4;
                  setState(() {});
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
          onTap: () {
            index = 2;
            setState(() {});
          },
          child: buildFloating()),
    );
  }
}
