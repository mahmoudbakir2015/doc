import 'package:doc/constant/style.dart';
import 'package:doc/widgets/default_button.dart';
import 'package:doc/widgets/light_text.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../face_id/face_id.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController pinController = TextEditingController();
  String? pin = '12345';
  PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromRGBO(
          234,
          239,
          243,
          1,
        ),
      ),
      borderRadius: BorderRadius.circular(Styles.borderRadius),
    ),
  );
  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

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
            const LightText(text: 'OTP Verification'),
            const SizedBox(
              height: 20,
            ),
            const SubText(
              text:
                  'Add a PIN number to make your account more secure and easy to sign in.',
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Pinput(
                controller: pinController,
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(Styles.borderRadius),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: const Color.fromRGBO(234, 239, 243, 1),
                  ),
                ),
                validator: (s) {
                  if (s == pin) {
                    pin = s;
                    return " Pin is correct";
                    /* to navigate auto 
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const FaceId(),
                    //   ),
                    // );
                    // */
                  } else if (s != pin) {
                    return 'Pin is incorrect';
                  }
                  return null;
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
            ),
            const Spacer(),
            DefaultButton(
              onPressed: () {
                //to navigate with button
                if (pinController.text == pin) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FaceId(),
                    ),
                  );
                }
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
