import 'package:doc/constant/style.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_list_tile.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Column(
          children: [
            CustomListTile(
              isMain: false,
              text: 'MyAppointment',
            ),
          ],
        ),
      ),
    );
  }
}
