import 'package:doc/constant/style.dart';
import 'package:doc/presentation/main_screen/items.dart';
import 'package:flutter/material.dart';

import '../../constant/assets.dart';
import '../calender/calender.dart';
import '../home/home.dart';
import '../message/message.dart';
import '../profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screen = [
    const Home(),
    MessagesView(),
    const CalenderView(),
    const ProfilePage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: screen[index],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
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
              color: index == 2 ? Colors.blue : Colors.black,
              icon: Assets.calender,
              onTap: () {
                index = 2;
                setState(() {});
              }),
          const Spacer(
            flex: 1,
          ),
          buildIconNav(
              color: index == 3 ? Colors.blue : Colors.black,
              icon: Assets.home,
              onTap: () {
                index = 3;
                setState(() {});
              }),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloating(),
    );
  }
}
