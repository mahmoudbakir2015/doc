import 'package:doc/presentation/middel_ware/item.dart';
import 'package:doc/widgets/water_mark.dart';
import 'package:flutter/material.dart';
import '../../widgets/logo.dart';

// ignore: must_be_immutable
class MiddelWare extends StatelessWidget {
  MiddelWare({super.key});
  bool isLogined = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
      ),
      body: Stack(
        children: [
          const WaterMark(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: buildContent(context),
          ),
        ],
      ),
    );
  }
}
