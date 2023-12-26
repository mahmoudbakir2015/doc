import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/core/cashe_helper.dart';
import 'package:doc/widgets/light_text.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/default_button.dart';
import '../../main_screen/main_screen.dart';

class FaceId extends StatelessWidget {
  const FaceId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const LightText(text: 'Face ID'),
            const SizedBox(
              height: 10,
            ),
            const SubText(
              text:
                  'Add a Face ID to make your account more secure and easy to sign in.',
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: const Color(0xFFF4F8FF),
                radius: 150,
                child: SvgPicture.asset(Assets.faceId),
              ),
            ),
            const Spacer(),
            DefaultButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MainScreen(
                        token: CacheHelper.getData(key: 'authorization')
                            .toString(),
                      ),
                    ),
                    (route) => false);
              },
              text: 'Submit',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
