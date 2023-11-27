import 'package:doc/constant/style.dart';
import 'package:doc/presentation/auth/otp/otp.dart';
import 'package:doc/widgets/light_text.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';

import '../../../constant/assets.dart';
import '../../../widgets/custom_phone_form.dart';
import '../../../widgets/default_button.dart';

class Forget extends StatelessWidget {
  const Forget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 80,
            ),
            const LightText(text: "Forgot Password"),
            const SubText(
                text:
                    'At our app, we take the security of your information seriously.'),
            const SizedBox(
              height: 30,
            ),
            PhoneForm(
              selectedFlag: Assets.selectedFlag,
              flags: Assets.flags,
              phone: phone,
            ),
            const Spacer(),
            DefaultButton(
              text: 'Reset Password',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Otp(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
