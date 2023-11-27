import 'package:flutter/material.dart';

import '../presentation/auth/login/login.dart';
import '../presentation/auth/register/register.dart';

Row buildFooter({required BuildContext context, bool isLogin = true}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        isLogin
            ? 'Already have not an account yet?'
            : "Already have an account yet?",
        style: const TextStyle(
          color: Color(0xFF242424),
          fontSize: 15,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      GestureDetector(
        onTap: () {
          if (isLogin == true) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Register(),
              ),
            );
          } else {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => false,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            isLogin ? 'Sign Up ' : 'SignIn',
            style: const TextStyle(
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
