// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doc/constant/constants.dart';
import 'package:doc/presentation/profile/settings/language/items.dart';
import 'package:doc/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:doc/widgets/custom_space.dart';
import '../../../../constant/style.dart';
import '../../../../widgets/custom_choose_tile.dart';
import '../../../../widgets/custom_list_tile.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Column(
          children: [
            CustomListTile(
              isMain: false,
              text: 'Languages',
            ),
            buildCustomSpace(context),
            buildSearch(
              search: search,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      active = index;

                      setState(() {});
                    },
                    child: CustomChooseTile(
                      active: active,
                      text: Constants.languages[index],
                      choose: index,
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: Constants.languages.length,
              ),
            ),
            DefaultButton(
              onPressed: () {
                print(Constants.languages[active]);
              },
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
