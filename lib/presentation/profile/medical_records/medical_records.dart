import 'package:doc/constant/style.dart';
import 'package:doc/widgets/custom_bold_text.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

import 'items.dart';

class MedicalRecord extends StatelessWidget {
  const MedicalRecord({super.key});

  @override
  Widget build(BuildContext context) {
    List details = [
      'red blood cell : 4.10 million cells/mcL',
      'red blood cell : 4.10 million cells/mcL',
      'red blood cell : 4.10 million cells/mcL',
      'red blood cell : 4.10 million cells/mcL',
      'red blood cell : 4.10 million cells/mcL',
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: Styles.appPadding),
              child: CustomListTile(
                trailing: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.list),
                ),
                isMain: false,
                text: 'Medical Record',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: Styles.appPadding),
              child: buildBoldText(text: 'This Month'),
            ),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return buildRecord(
                    date: 'Feb 25',
                    typeRecord: 'End of observation',
                    details: details,
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Styles.appPadding),
              child: buildBoldText(text: 'January'),
            ),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return buildRecord(
                    date: 'Feb 25',
                    typeRecord: 'End of observation',
                    details: details,
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
