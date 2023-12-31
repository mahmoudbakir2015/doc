import 'package:doc/constant/style.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class Diagnostic extends StatelessWidget {
  const Diagnostic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Column(
          children: [
            CustomListTile(
              isMain: false,
              text: 'Diagnostic',
            ),
          ],
        ),
      ),
    );
  }
}
