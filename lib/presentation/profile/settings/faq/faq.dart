import 'package:doc/presentation/profile/settings/faq/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constant/assets.dart';
import '../../../../constant/style.dart';
import '../../../../widgets/custom_list_tile.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Styles.appPadding),
            child: CustomListTile(
              trailing: SvgPicture.asset(
                Assets.search,
              ),
              isMain: false,
              text: 'Faq',
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return buildFaq(
                  header:
                      '''What should I expect during a doctor's appointment?''',
                  description:
                      '''During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.''',
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
