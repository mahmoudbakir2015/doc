import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/custom_text_form.dart';
import '../register/register.dart';

// ignore: must_be_immutable
class RememberForget extends StatefulWidget {
  bool checkValue;
  RememberForget({super.key, required this.checkValue});

  @override
  State<RememberForget> createState() => _RememberForgetState();
}

class _RememberForgetState extends State<RememberForget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: widget.checkValue,
            onChanged: (bool? vale) {
              widget.checkValue = !widget.checkValue;
              setState(() {});
            }),
        const Text(
          'Remember me',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Spacer(),
        const Text(
          'Forgot Password?',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF247CFF),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        )
      ],
    );
  }
}

Form buildForm({
  required GlobalKey<FormState> formKey,
  required TextEditingController email,
  required TextEditingController password,
}) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        defaultTextForm(
          label: 'Email',
          controller: email,
          textInputType: TextInputType.emailAddress,
          iconData: Icons.email,
          onValidate: (String? value) {
            if (value!.isEmpty) {
              return "this field shouldn't be empty";
            } else if (!value.contains('@')) {
              return "this field is not mail";
            } else if (!value.contains('.com')) {
              return "this field is not mail";
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        defaultTextForm(
          label: 'password',
          controller: password,
          textInputType: TextInputType.emailAddress,
          iconData: Icons.password,
          onValidate: (String? value) {
            if (value!.isEmpty) {
              return "this field shouldn't be empty";
            } else if (value.length < 8) {
              return "this field should be greater  8 nums";
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

Row buildOrDivider() {
  return const Row(
    children: [
      Expanded(child: Divider()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Or sign in with',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        ),
      ),
      Expanded(child: Divider()),
    ],
  );
}

Text buildTermsAndConditions() {
  return const Text.rich(
    textAlign: TextAlign.center,
    maxLines: 2,
    TextSpan(
      children: [
        TextSpan(
          text: 'By logging, you agree to our',
          style: TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextSpan(
          text: 'Terms & Conditions',
          style: TextStyle(
            color: Color(0xFF242424),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: 'and',
          style: TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextSpan(
          text: 'PrivacyPolicy.',
          style: TextStyle(
            color: Color(0xFF242424),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Row buildSignUp({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Already have an account yet?',
        style: TextStyle(
          color: Color(0xFF242424),
          fontSize: 15,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Register(),
            ),
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Sign Up ',
            style: TextStyle(
              color: Color(0xFF247CFF),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ],
  );
}

GestureDetector buildSocialLogin({
  required String icon,
  Function()? onTap,
}) {
  return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
      ));
}
