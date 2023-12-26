import 'package:doc/constant/assets.dart';
import 'package:doc/data/model/doctor_model.dart';
import 'package:doc/presentation/chat/create_message/create_message.dart';
import 'package:doc/presentation/chat/message_page/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_search_filter.dart';
import '../chat_page/chat_page.dart';

// ignore: must_be_immutable
class MessagesView extends StatelessWidget {
  TextEditingController search = TextEditingController();
  MessagesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
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
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateMessage(),
                  ),
                );
              },
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
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          doctorModel: DoctorModel(),
                        ),
                      ),
                    );
                  },
                  child: buildNotificationCard(
                    image: Assets.docImage,
                    name: 'Dr. Randy Wigham',
                    subDetails: 'General Doctor | RSUD Gatot Subroto',
                    message:
                        '''Fine, I'll do a check. Does the patient have a history of certain diseases?''',
                    date: '7:11 PM',
                    notReaded: '2',
                  ),
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
