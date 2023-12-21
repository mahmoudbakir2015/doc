import 'package:flutter/material.dart';

import '../../constant/assets.dart';
import '../../constant/style.dart';
import '../../widgets/custom_bold_text.dart';
import '../../widgets/custom_search_filter.dart';
import '../home/doctor_page/items.dart';

Future<dynamic> buildCreateMessage(
    BuildContext context, TextEditingController search) {
  return showModalBottomSheet(
      context: (context),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(
            top: Styles.appPadding,
            left: Styles.appPadding,
            right: Styles.appPadding,
          ),
          child: Column(
            children: [
              ListTile(
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close)),
                title: buildBoldText(text: 'Create New Message'),
              ),
              CustomSearchFilter(
                controller: search,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          child: Image(
                            fit: BoxFit.scaleDown,
                            image: NetworkImage(
                              Assets.docImage,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildBoldText(text: 'Dr. Randy Wigham'),
                            buildLightText(
                                text: 'General Doctor | RSUD Gatot Subroto'),
                          ],
                        )
                      ],
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        );
      });
}
