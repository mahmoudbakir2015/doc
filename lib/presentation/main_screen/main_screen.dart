import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/business_logic/cubit/home_cubit/home_states.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/main_screen/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/assets.dart';

class MainScreen extends StatelessWidget {
  final String token;
  const MainScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
            child: Row(
              children: [
                buildIconNav(
                    color: cubit.currentIndex == 0 ? Colors.blue : Colors.black,
                    icon: Assets.home,
                    onTap: () {
                      cubit.changeNav(tap: 0);
                    }),
                const Spacer(flex: 1),
                buildIconNav(
                    color: cubit.currentIndex == 1 ? Colors.blue : Colors.black,
                    icon: Assets.chat,
                    onTap: () {
                      cubit.changeNav(tap: 1);
                    }),
                const Spacer(
                  flex: 2,
                ),
                buildIconNav(
                    color: cubit.currentIndex == 3 ? Colors.blue : Colors.black,
                    icon: Assets.calender,
                    onTap: () {
                      cubit.changeNav(tap: 3);
                    }),
                const Spacer(
                  flex: 1,
                ),
                buildIconNav(
                    image:
                        'https://th.bing.com/th/id/OIP.4siKIW3oZ4kEo0vkEVQ5hgHaLH?rs=1&pid=ImgDetMain',
                    isProfile: true,
                    color: cubit.currentIndex == 4 ? Colors.blue : Colors.black,
                    icon: Assets.home,
                    onTap: () {
                      cubit.changeNav(tap: 4);
                    }),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: GestureDetector(
              onTap: () {
                cubit.changeNav(tap: 2);
              },
              child: buildFloating()),
        );
      },
    );
  }
}
