import 'package:doc/presentation/chat/create_message/items.dart';
import 'package:flutter/material.dart';

import '../../../constant/assets.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_bold_text.dart';
import '../../../widgets/custom_search_filter.dart';
import '../chat_page/chat_page.dart';

class CreateMessage extends StatelessWidget {
  const CreateMessage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
            ),
          ),
        ),
        centerTitle: true,
        title: buildBoldText(text: 'Create New Message'),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Styles.appPadding,
            left: Styles.appPadding,
            right: Styles.appPadding,
          ),
          child: Column(
            children: [
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
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ChatPage(),
                          ),
                        );
                      },
                      child: buildCreateSearchedDoc(
                        name: 'Mahmoud Elsayed',
                        image: Assets.docImage,
                        description: 'Mahmoud is good man',
                      ),
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
        ),
      ),
    );
  }
}
