import 'package:doc/presentation/middel_ware/middel_ware.dart';
import 'package:flutter/material.dart';
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
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => MiddelWare(),
            ),
            (route) => false));
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
