import 'package:flutter/material.dart';

import '../../../widgets/custom_list_tile.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomListTile(
            isMain: false,
            text: 'MyAppointment',
          ),
        ],
      ),
    );
  }
}
