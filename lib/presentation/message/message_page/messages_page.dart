import 'package:doc/constant/assets.dart';
import 'package:doc/presentation/message/message_page/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_search_filter.dart';

// ignore: must_be_immutable
class MessagesView extends StatelessWidget {
  TextEditingController search = TextEditingController();
  MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Styles.appPadding,
        right: Styles.appPadding,
        top: Styles.appPadding,
      ),
      child: ListView(
        children: [
          CustomListTile(
            text: 'Message',
            trailing: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.messageAdd,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: CustomSearchFilter(
              controller: search,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return buildDocCard(
                  name: 'Dr. Randy Wigham',
                  subDetails: 'General Doctor | RSUD Gatot Subroto',
                  message:
                      '''Fine, I'll do a check. Does the patient have a history of certain diseases?''',
                  date: '7:11 PM',
                  notReaded: '2',
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider(
                  thickness: 0.5,
                );
              },
              itemCount: 20,
            ),
          ),
          Container(
            height: 40,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
