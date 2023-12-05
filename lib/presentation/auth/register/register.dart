import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/footer_auth.dart';
import '../../../widgets/form.dart';
import '../../../widgets/light_text.dart';
import '../../../widgets/social_login.dart';
import '../../../widgets/terms_cond.dart';
import '../../main_screen/main_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              const LightText(
                text: 'Create Account',
              ),
              const SizedBox(
                height: 30,
              ),
              const SubText(
                text:
                    '''Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!''',
              ),
              const SizedBox(
                height: 50,
              ),
              FormSheet(
                phone: phone,
                isLogined: false,
                formKey: formKey,
                email: email,
                password: password,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Styles.appPadding),
                child: DefaultButton(
                  text: 'Create Account',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
              ),
              buildOrDivider(isLogined: false),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Styles.appPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSocialLogin(icon: Assets.google, onTap: () {}),
                    buildSocialLogin(icon: Assets.facebook, onTap: () {}),
                    buildSocialLogin(icon: Assets.apple, onTap: () {}),
                  ],
                ),
              ),
              buildTermsAndConditions(),
              const SizedBox(
                height: 30,
              ),
              buildFooter(context: context, isLogin: false),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
