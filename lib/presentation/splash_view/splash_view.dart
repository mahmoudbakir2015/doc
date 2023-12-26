import 'package:doc/presentation/main_screen/main_screen.dart';
import 'package:doc/presentation/middel_ware/middel_ware.dart';
import 'package:flutter/material.dart';
import '../../core/cashe_helper.dart';
import '../../widgets/logo.dart';
import '../../widgets/water_mark.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (CacheHelper.getData(key: 'token') != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MainScreen(
              token: CacheHelper.getData(key: 'token').toString(),
            ),
          ),
          (route) => false,
        );
      } else {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MiddelWare(),
          ),
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          WaterMark(),
          Logo(),
        ],
      ),
    );
  }
}
