import 'package:doc/presentation/auth/login/login.dart';
import 'package:flutter/material.dart';

import '../../constant/assets.dart';
import '../../widgets/default_button.dart';

Column buildContent(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.height * .6,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              Assets.docImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const Text(
        'Best Doctor Appointment App',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF247CFF),
          fontSize: 32,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
      const Text(
        maxLines: 2,
        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF757575),
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      const Spacer(),
      DefaultButton(
        text: 'Get Started',
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
            (route) => false,
          );
        },
      ),
    ],
  );
}
