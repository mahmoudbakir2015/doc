import 'package:doc/presentation/profile/diagonestic/diagnostic.dart';
import 'package:doc/presentation/profile/items.dart';
import 'package:doc/presentation/profile/medical_records/medical_records.dart';
import 'package:doc/presentation/profile/my_appointment/my_appointment.dart';
import 'package:doc/presentation/profile/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/assets.dart';
import '../../constant/style.dart';
import 'personal_information/personal_information.dart';
import 'settings/setting_page/settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF247CFF),
      body: Stack(
        children: [
          buildBar(
              context: context,
              setting: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              }),
          Positioned(
            top: MediaQuery.of(context).size.height * .25,
            right: 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * .25,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Styles.appPadding),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .15,
                    ),
                    buildName(name: 'Mahmoudbakir'),
                    buildEmail(email: 'mahmoud@gmail.com'),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildChooseButton(
                          text: 'My Appointment',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MyAppointment(),
                              ),
                            );
                          },
                          context: context,
                        ),
                        const VerticalDivider(
                          width: 1,
                          thickness: 1,
                        ),
                        buildChooseButton(
                          isAppointment: false,
                          text: 'Medical records',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MedicalRecord(),
                              ),
                            );
                          },
                          context: context,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .04,
                    ),
                    buildListTile(
                      text: 'Personal Information',
                      icon: Assets.personalCard,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PersonalInformation(),
                          ),
                        );
                      },
                    ),
                    buildListTile(
                      text: 'My Test & Diagnostic',
                      icon: Assets.diagnostic,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Diagnostic(),
                          ),
                        );
                      },
                    ),
                    buildListTile(
                      text: 'Payment',
                      icon: Assets.payment,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Payment(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .25 -
                MediaQuery.of(context).size.width * .12,
            right: 0,
            left: 0,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * .12,
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .25 -
                MediaQuery.of(context).size.width * .1,
            right: 0,
            left: 0,
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: MediaQuery.of(context).size.width * .1,
              child: const Center(
                child: Image(
                    height: 80,
                    image: NetworkImage(
                      Assets.docImage,
                    )),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .26,
            right: 0,
            left: MediaQuery.of(context).size.width * .18,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * .03,
                backgroundColor: const Color(0xFFF8F8F8),
                child: SvgPicture.asset(Assets.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
