import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/auth/login/items.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/light_text.dart';
import '../../home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            const LightText(
              text: 'Welcome Back',
            ),
            const SizedBox(
              height: 30,
            ),
            const SubText(
              text:
                  ''' We're excited to have you back, can't wait to see what you've been up to since you last logged in.''',
            ),
            const SizedBox(
              height: 50,
            ),
            buildForm(
              email: email,
              password: password,
              formKey: formKey,
            ),
            RememberForget(checkValue: checkValue),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Styles.appPadding),
              child: DefaultButton(
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                      (route) => false,
                    );
                  }
                },
              ),
            ),
            buildOrDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Styles.appPadding),
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
            buildSignUp(context: context),
          ],
        ),
      ),
    );
  }
}
